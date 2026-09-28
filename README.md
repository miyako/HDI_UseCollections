![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_UseCollections

Working with the 4D **Collection** variable type -- creation, JSON stringify/parse round-tripping, zero-based object-notation access, sparse growth, and iterating over heterogeneous items. Originally published by 4D as a **HDI** (*How Do I*) example for **4D v16**; converted from the binary `.4DB` to the `.4DProject` architecture so it runs on current 4D releases.

## What it demonstrates

- Creating collections with `New collection`, including nesting one collection inside another and mixing types (numbers, text, dates, booleans, objects) in a single collection.
- Serializing a collection to JSON with `JSON Stringify` and parsing a JSON array string back into a collection with `JSON Parse`.
- Reading and writing collection items with zero-based object notation (`col[0]`), as opposed to the curly-brace, one-based indexing used by 4D arrays.
- Storing a collection as a property of an object with `OB SET`, and reading it back with `OB Get`.
- Growing a collection lazily by assigning to indices beyond its current length, leaving the skipped slots `Undefined`.
- Reading the `.length` property and looping over a collection with `Value type` / `Undefined` to classify each item (boolean, text, real, object, null, undefined).
- Driving the demo's own tab pages from a localized JSON file (`SAMPLES-en.json` / `SAMPLES-ja.json`), sorted with `orderBy` and expanded into arrays with `COLLECTION TO ARRAY`.

## Key commands

| Command | Used for |
|---|---|
| `New collection` | Creating a collection, optionally pre-filled with mixed-type or nested-collection values |
| `JSON Stringify` | Serializing a collection to a JSON string |
| `JSON Parse` | Parsing a JSON string back into a collection |
| `OB SET` / `OB Get` | Storing and retrieving a collection as an object property |
| `.length` | Reading the number of items in a collection |
| `Value type` / `Undefined` | Classifying each item's type and detecting gaps left by sparse assignment |
| `orderBy` / `COLLECTION TO ARRAY` | Sorting the samples collection and expanding it into the tab control's arrays |

## How it works

`00_Start` opens the `HDI` splash window; closing it opens `HDI2`, the demo form. On `On Load`, `HDI2/method.4dm` calls `initHDI`, which parses the localized `SAMPLES-*.json` resource, sorts it with `orderBy("SampleSort asc")`, and spreads it into the `_TabControl` / `_TextTabControl` arrays via `COLLECTION TO ARRAY` so each tab page shows its own description. `On Page Change` swaps the displayed text and resets the demo's `vNum`/`vString`/`boo`/`obj`/`col` variables.

Each tab's button runs a self-contained snippet of collection code:

- `Button` / `Button1` / `Button2` -- build three collections (`col1`, `col2` nesting `col1`, and `col3` nesting both `col1` and `col2`) and stringify one of them with `JSON Stringify`.
- `Button4` -- parses a hardcoded JSON array string (`vString2`) back into a collection with `JSON Parse`.
- `Button3` -- builds a mixed-type collection (number, text, object, boolean) and reads each item back with `col[0]`..`col[3]`, illustrating zero-based object-notation access.
- `Button5` -- stores two collections into an object with `OB SET`, then reads them back with `OB Get`.
- `Button6` -- builds a sparse collection by assigning only to indices `0`, `5`, and `10`, leaving the rest `Undefined`.
- `Button7` -- builds a mixed-type collection, then loops over it with `Value type` / `Undefined` to count booleans, texts, reals, objects, nulls, and undefined slots.

## Points of interest

- Collections use square brackets `col[0]`, not the curly braces `col{0}` used by 4D arrays -- and the first item is index `0`, not `1`.
- Assigning to an index beyond the current length (e.g. `col[10]:="Lima"` on an empty collection) auto-grows the collection; the skipped indices become `Undefined`, not `Null` -- `Button7`'s counting loop distinguishes the two.
- A collection can hold another collection as an item (`col3:=New collection(col1;col2)`), and object notation lets you nest arbitrarily deep.
- `OB SET` / `OB Get` treat a collection like any other object property value -- there is no separate "collection property" API.
- The demo's own descriptive text (`SAMPLES-en.json` / `SAMPLES-ja.json`) is itself parsed with `JSON Parse` into a collection and localized by database language, so the object notation described on the tabs is exercised by the tab-loading code too.

## Modernisation notes

Converted from the original binary `.4DB` to a 4D project.

| Branch | Description | Instructions |
|--------|-------------|--------------|
| [`miyako-modernize-hdi-project`](../../tree/miyako-modernize-hdi-project) | Full modernisation on top of `main`: method visibility, XLIFF localisation, `var`/`#DECLARE` syntax, standard menu actions, a rebuilt startup dialog (window reuse, `CALL WORKER`, `BtnDemo` object method), and dark mode/Liquid Glass CSS. | [method.visibility.instructions.md](.github/instructions/method.visibility.instructions.md), [localisation.instructions.md](.github/instructions/localisation.instructions.md), [variable.declarations.instructions.md](.github/instructions/variable.declarations.instructions.md), [menu.instructions.md](.github/instructions/menu.instructions.md), [startup.instructions.md](.github/instructions/startup.instructions.md), [css.instructions.md](.github/instructions/css.instructions.md), [tahoe.css.instructions.md](.github/instructions/tahoe.css.instructions.md) |

## References

- [4D blog: A new type of variable: collections](https://blog.4d.com/new-type-of-variable-collections/)
- [4D documentation: Collections](https://developer.4d.com/docs/Concepts/collections)
- [4D documentation: JSON Stringify](https://developer.4d.com/docs/commands/json-stringify)
- [4D documentation: JSON Parse](https://developer.4d.com/docs/commands/json-parse)
- [4D documentation: OB SET](https://developer.4d.com/docs/commands/ob-set) / [OB Get](https://developer.4d.com/docs/commands/ob-get)
- Original download: [HDI_UseCollections.zip](https://download.4d.com/Demos/4D_v16_R4/HDI_UseCollections.zip)
- Index of v16/v17 HDIs: [miyako/4d-hdi](https://github.com/miyako/4d-hdi)
