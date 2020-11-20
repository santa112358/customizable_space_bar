# customizable_space_bar


[![pub package](https://img.shields.io/pub/v/customizable_space_bar.svg)](https://pub.dev/packages/customizable_space_bar)
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>

AppBar which changes the content with scrolling rate. Enables to implement "Large Title"

![13063567123474](https://user-images.githubusercontent.com/43510799/99781850-b98d5e00-2b5b-11eb-8233-e36e3197d9af.gif)

## Usage

This package is expected to be used with `flexibleSpace:` in `SliverAppBar`, which means you also need to use `CustomScrollView`.

```dart
    CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,

            /// This is the part you use this package
            flexibleSpace: CustomizableSpaceBar(
              builder: (context, scrollingRate) {
                /// Example content
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: 13, left: 12 + 40 * scrollingRate),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Hello World.",
                      style: TextStyle(
                          fontSize: 42 - 18 * scrollingRate,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
            /// End of the part

            expandedHeight: 150,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text("LIST ITEM"),
                );
              },
            ),
          )
        ],
      ),

```

You can control the layout in the AppBar with `scrollingRate`.

When the shape is fully expanded, `scrollingRate` is `0.0`. When the shape is collapsed to AppBar, it reaches to the limit `1.0`.

![13063658045969](https://user-images.githubusercontent.com/43510799/99783456-ca3ed380-2b5d-11eb-9158-c24f1676efcf.gif)

If you have any requests or questions, please feel free to ask on [github](https://github.com/santa112358/customizable_space_bar/issues).



