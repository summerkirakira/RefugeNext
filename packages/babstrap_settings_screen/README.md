# Babstrap settings screen

This project allows you to create an intuitive and visually appealing Settings screen for your Flutter applications.

Compatible with Android & iOS & Web.

![Version 0.1.7](https://img.shields.io/badge/pub-0.1.7-orange) [![Twitter](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Ftwitter.com%2FBabacar51193320)](https://twitter.com/babstrap)

## Showcase

| **Settings screen**                                                                                                                                       | **SmallUserCard**                                                                                                                                                         |
| --------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <img width="300" alt="settingsscreenpreview" src="https://user-images.githubusercontent.com/65053170/134021464-2a2107ee-9e90-4303-bfd3-daffcdc8bc0d.png"> | <img width="300" alt="smallcard" src="https://user-images.githubusercontent.com/65053170/134023961-6c5a3119-8ccd-4022-85a2-d8fa205c2197.png">                             |
| **BigUserCard**                                                                                                                                           | **SimpleUserCard**                                                                                                                                                        |
| <img width="300" alt="bigUserCard" src="https://user-images.githubusercontent.com/65053170/134026989-ec7415d2-79da-43fe-a497-a1c42f296f65.png">           | <img width="300" alt="Capture d’écran 2021-08-16 à 17 31 34" src="https://user-images.githubusercontent.com/65053170/134023718-59e42ff5-1a66-4579-b728-9355a856aa70.png"> |

## Getting started

- add the following dependency in your `pubspact.yaml` file:

```dart
dependencies:
  babstrap_settings_screen : "^latest_version"
```

- add import in your `dart` code:

```dart
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
```

- Example

```dart
Padding(
  padding: const EdgeInsets.all(10),
  child: ListView(
    children: [
      // User card
      BigUserCard(
        cardColor: Colors.red,
        userName: "Babacar Ndong",
        userProfilePic: AssetImage("assets/logo.png"),
        cardActionWidget: SettingsItem(
          icons: Icons.edit,
          iconStyle: IconStyle(
            withBackground: true,
            borderRadius: 50,
            backgroundColor: Colors.yellow[600],
          ),
          title: "Modify",
          subtitle: "Tap to change your data",
          onTap: () {
            print("OK");
          },
        ),
      ),
      SettingsGroup(
        backgroundColor: Colors.blue,
        items: [
          SettingsItem(
            onTap: () {},
            icons: CupertinoIcons.pencil_outline,
            iconStyle: IconStyle(),
            title: 'Appearance',
            subtitle: "Make Ziar'App yours",
          ),
          SettingsItem(
            onTap: () {},
            icons: Icons.dark_mode_rounded,
            iconStyle: IconStyle(
              iconsColor: Colors.white,
              withBackground: true,
              backgroundColor: Colors.red,
            ),
            title: 'Dark mode',
            subtitle: "Automatic",
            trailing: Switch.adaptive(
              value: false,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
      SettingsGroup(
        items: [
          SettingsItem(
            onTap: () {},
            icons: Icons.info_rounded,
            iconStyle: IconStyle(
              backgroundColor: Colors.purple,
            ),
            title: 'About',
            subtitle: "Learn more about Ziar'App",
          ),
        ],
      ),
      // You can add a settings title
      SettingsGroup(
        settingsGroupTitle: "Account",
        items: [
          SettingsItem(
            onTap: () {},
            icons: Icons.exit_to_app_rounded,
            title: "Sign Out",
          ),
          SettingsItem(
            onTap: () {},
            icons: CupertinoIcons.delete_solid,
            title: "Delete account",
            titleStyle: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ],
  ),
),
```

## Components

- SettingsGroup

| Parameters                  | Type                 | Description                                                       |
| --------------------------- | -------------------- | ----------------------------------------------------------------- |
| **settingsGroupTitle**      | String?              | Use it to add a Title for the group                               |
| **settingsGroupTitleStyle** | TextStyle?           | Adapt the style of the title to your liking                       |
| **backgroundColor**         | Color?               | Use it to custom item's colors                                    |
| **items**                   | `List<SettingsItem>` | Use it to add the **SettingsItem** allowing the user to do action |
| **iconItemSize**            | double?              | Use it to increase or decrease all **SettingsItem** icon size     |

- SettingsItem

| Parameters        | Type         | Description                                                     |
| ----------------- | ------------ | --------------------------------------------------------------- |
| **icons**         | IconData     | Use it to add an Icon at the beginning                          |
| **iconStyle**     | IconStyle?   | Use it to change the icon colour, add the icon background, etc. |
| **title**         | String       | Use it to add a title on the **SettingsItem**                   |
| **titleStyle**    | TextStyle?   | Use it to change the title style                                |
| **subtitle**      | String?      | Use it to add a subtitle on the **SettingsItem**                |
| **subtitleStyle** | TextStyle?   | Use it to change the subtitle style                             |
| **trailing**      | Widget?      | Use it to add a widget at the end of the **SettingsItem**       |
| **onTap**         | VoidCallback | Use it to trigger an action on click                            |

- BigUserCard

| Parameters               | Type          | Description                                                                                           |
| ------------------------ | ------------- | ----------------------------------------------------------------------------------------------------- |
| **userProfilePic**       | ImageProvider | Use it to display an image                                                                            |
| **cardColor**            | Color?        | Use it to change the card color                                                                       |
| **cardRadius**           | double?       | Use it to change the card corner radius                                                               |
| **backgroundMotifColor** | Color?        | Use it to change the card background motif color                                                      |
| **cardActionWidget**     | Widget?       | Use it to add an other Widget on the card for managing the onTap action (You use a SettingsItem here) |
| **userName**             | String?       | Use it to add the user name                                                                           |
| **userMoreInfo**         | Widget?       | Use it to add more user's informations                                                                |

- SmallUserCard

| Parameters               | Type          | Description                                      |
| ------------------------ | ------------- | ------------------------------------------------ |
| **userProfilePic**       | ImageProvider | Use it to display an image                       |
| **cardColor**            | Color?        | Use it to change the card color                  |
| **cardRadius**           | double?       | Use it to change the card corner radius          |
| **backgroundMotifColor** | Color?        | Use it to change the card background motif color |
| **onTap**                | VoidCallback  | Use it to trigger an action on Card clicked      |
| **userName**             | String?       | Use it to add the user name                      |
| **userMoreInfo**         | Widget?       | Use it to add more user's informations           |

- SimpleUserCard

| Parameters         | Type          | Description                                           |
| ------------------ | ------------- | ----------------------------------------------------- |
| **userProfilePic** | ImageProvider | Use it to display an image                            |
| **userName**       | String        | Use it to add the user name                           |
| **imageRadius**    | double?       | Use it to change the image corner                     |
| **onTap**          | VoidCallback? | Use it to trigger an action on the Image              |
| **textStyle**      | TextStyle?    | Use it to change the **userName** text style          |
| **icon**           | Icon?         | Use it tot add a Icon on the image for improve the UI |

## Licence

Licence MIT

## Author

[Babacar NDONG](https://x.com/babstrap)
