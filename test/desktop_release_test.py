import importlib.util
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import stat
import os
import zipfile
import unittest

spec = importlib.util.spec_from_file_location('release', Path(__file__).resolve().parents[1]/'scripts/desktop_release.py')
release = importlib.util.module_from_spec(spec)
spec.loader.exec_module(release)

class PublishTests(unittest.TestCase):
    def test_mac_packaging_preserves_unicode_modes_and_links(self):
        spec = importlib.util.spec_from_file_location('package', Path(__file__).resolve().parents[1]/'scripts/package_macos_app.py')
        module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module)
        with tempfile.TemporaryDirectory() as temp:
            app = Path(temp)/'星河避难所.app'
            binary = app/'Contents/MacOS/星河避难所'
            binary.parent.mkdir(parents=True)
            binary.write_bytes(b'fixture'); binary.chmod(0o755)
            link = app/'Contents/current'; link.symlink_to('MacOS')
            archive = Path(temp)/'app.zip'; module.package(app,archive)
            with zipfile.ZipFile(archive) as z:
                entry = z.getinfo('星河避难所.app/Contents/MacOS/星河避难所')
                self.assertTrue(entry.flag_bits & 0x800)
                self.assertEqual((entry.external_attr >> 16) & 0o777,0o755)
                entry = z.getinfo('星河避难所.app/Contents/current')
                self.assertTrue(stat.S_ISLNK(entry.external_attr >> 16))
                self.assertEqual(z.read(entry),b'MacOS')

    def test_public_verification_precedes_activation_and_releases_are_immutable(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            public = root/'public'; public.write_bytes(b'valid bundle')
            staged = root/'staged'; staged.write_bytes(public.read_bytes())
            manifest = dict(platform='windows',architecture='x64',name='4.6.3',code=443,
                            notes='a\nb',url=public.as_uri(),size=public.stat().st_size,sha256=release.digest(public))
            def publish(value, name='artifact.zip'):
                staged.write_bytes(public.read_bytes())
                return subprocess.run([sys.executable,'-c',release.REMOTE],input=json.dumps(dict(
                    manifest=value,root=str(root/'assets'),staged=str(staged),name=name)),text=True,capture_output=True)
            result = publish(manifest)
            self.assertEqual(result.returncode,0,result.stderr)
            latest = root/'assets/windows/x64/latest.json'
            before = latest.read_bytes()
            public.write_bytes(b'changed bytes')
            bad = {**manifest,'code':444,'size':public.stat().st_size,'sha256':release.digest(public)}
            self.assertNotEqual(publish(bad).returncode,0)
            self.assertEqual(latest.read_bytes(),before)
            bad['url'] = (root/'missing.zip').as_uri()
            self.assertNotEqual(publish(bad,'new.zip').returncode,0)
            self.assertEqual(latest.read_bytes(),before)
            self.assertNotEqual(publish({**bad,'code':442},'older.zip').returncode,0)
            self.assertEqual(latest.read_bytes(),before)

if __name__ == '__main__': unittest.main()
