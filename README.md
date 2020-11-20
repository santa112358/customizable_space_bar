# customizable_space_bar

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

When the shape is fully expanded, `scrollingRate` is `0.0`. When the shape is collapsed to AppBar, it reaches to the limit `1.0`.

You can control the layout in the AppBar with scrollingRate like the example above.

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
