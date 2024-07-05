import 'dart:async';
import 'dart:collection';

/// 定义一个类型别名，表示一个接收参数并返回Future的函数
typedef AsyncFunctionWithParam<T, R> = Future<R> Function(T param);

class WorkerPool<T, R> {
  final int maxWorkers;
  final Queue<_Task<T, R>> _taskQueue = Queue();
  int _activeWorkers = 0;

  WorkerPool(this.maxWorkers);

  Future<R> _runTask(_Task<T, R> task) async {
    _activeWorkers++;
    try {
      final result = await task.function(task.param);
      task.completer.complete(result);
    } catch (e) {
      task.completer.completeError(e);
    } finally {
      _activeWorkers--;
      _scheduleNext();
    }
    return task.completer.future;
  }

  void _scheduleNext() {
    if (_taskQueue.isNotEmpty && _activeWorkers < maxWorkers) {
      final task = _taskQueue.removeFirst();
      _runTask(task);
    }
  }

  Future<R> addTask(AsyncFunctionWithParam<T, R> function, T param) {
    final task = _Task(function, param);
    _taskQueue.add(task);
    _scheduleNext();
    return task.completer.future;
  }
}

class _Task<T, R> {
  final AsyncFunctionWithParam<T, R> function;
  final T param;
  final Completer<R> completer = Completer<R>();

  _Task(this.function, this.param);
}

/// 接收一个异步函数和一个参数列表，并等待其全部执行完成后返回结果的异步函数
Future<List<R>> runAsyncFunctionWithParams<T, R>(
    AsyncFunctionWithParam<T, R> asyncFunction, List<T> params, int maxWorkers) async {
  final workerPool = WorkerPool<T, R>(maxWorkers);

  // 创建一个包含所有异步操作结果的Future列表
  List<Future<R>> futures = params.map((param) => workerPool.addTask(asyncFunction, param)).toList();

  // 使用Future.wait等待所有异步操作完成
  List<R> results = await Future.wait(futures);

  return results;
}



String? extractCsrfToken(String page) {
  if (page.split('csrf-token" content="').length <= 1) {
    return null;
  }
  String csrfToken = page.split('csrf-token" content="')[1].split('"')[0];
  return csrfToken;
}