<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>README.litcoffee</code>
  <hr />
  <div align="justify">
    Copyright © 2018 Kyebego.
    Code released under GNU GPLv3 (or any later version);
      documentation released under CC BY-SA 4.0.
    For more information, see the license notice at the bottom of this
      document.
  </div>
</div>

___

#  ｍｅｒｍａｉｄ  #

**ｍｅｒｍａｉｄ** is an RDF graph library written in Literate
  CoffeeScript and licensed under the GNU GPLv3.
This file will serve as your introduction to the source code, and
  provide information on the project in general.

ｍｅｒｍａｉｄ targets browsers—more or less.
It will interpret `self` or `window` as the "global object" if it
  exists; otherwise it will assign to `exports` for CommonJS requires.
Please try to ensure that one of these objects exists in your
  environment _before_ running this code—otherwise, nothing will
  happen!

    global = self ? window ? exports
    throw new ReferenceError "Unknown global object." unless global

##  Required Constructors  ##

Many ｍｅｒｍａｉｄ functions can only be called as constructors.
The `constructǃ` function makes checking for this easy.

    constructǃ = (context, constructor, type) ->
      throw new TypeError "
        #{type} must be called as a constructor.
      " unless context?
      throw new TypeError "
        This is not a #{type}.
      " unless context instanceof constructor

##  Uncallable Constructors  ##

To save space, the generator function `Ø` is defined for generating
  uncallable constructors whenever they are needed in the code.
`Ø` takes as its arguments an `identifier`, which will be inferred as
  the function name (not actually in ES 5.1, but potentially in later
  versions), and `ℙ`, which is the (real) prototype for the fake
  constructor.

    Ø = (identifier = "anonymous", ℙ = Object::) ->
      obj = [identifier]: -> throw new TypeError "Illegal constructor."
      Object.defineProperty obj[identifier], "prototype",
        configurable: no
        value: ℙ
        writable: no

##  Using ｍｅｒｍａｉｄ  ##

All ｍｅｒｍａｉｄ constants, objects, and constructors are made
available through the `ｍｅｒｍａｉｄ` object.
The `ｍｅｒｍａｉｄ` object is technically an instance of
`Ｍｅｒｍａｉｄ`—but this constructor doesn't do anything and can't
actually be called.

    Object.defineProperty (Ｍｅｒｍａｉｄ = ->)::, "constructor",
      configurable: no
      value: Ø "Ｍｅｒｍａｉｄ", Ｍｅｒｍａｉｄ::
      writable: no
    ｍｅｒｍａｉｄ = new Ｍｅｒｍａｉｄ

ｍｅｒｍａｉｄ targets vanilla ES 5.1, so it doesn't use modules or
  similar.
It simply attaches itself to the global object at `"ｍｅｒｍａｉｄ"`.
For the adventurous, you can also access the ｍｅｒｍａｉｄ object from
  the emoji sequence `"🧜‍♀️🌊"`.
Nongendered merpeople are allowed too!

    SIGIL = do ->
      MALE = "\u2642"
      MERPERSON = "\u{1F9DC}"
      FEMALE = "\u2640"
      VS16 = "\uFE0F"
      WAVE = "\u{1F30A}"
      ZWJ = "\u200D"
      Object.defineProperties global,
        ｍｅｒｍａｉｄ:
          configurable: yes
          value: ｍｅｒｍａｉｄ
        "#{MERPERSON}#{WAVE}":
          configurable: yes
          value: ｍｅｒｍａｉｄ
        "#{MERPERSON}#{ZWJ}#{FEMALE}#{VS16}#{WAVE}":
          configurable: yes
          value: ｍｅｒｍａｉｄ
        "#{MERPERSON}#{ZWJ}#{MALE}#{VS16}#{WAVE}":
          configurable: no
          value: null  #  No boys allowed!!
      return "#{MERPERSON}#{WAVE}"

##  Identity Information  ##

The global `ｍｅｒｍａｉｄ` object identifies itself using a number of
  properties, so that you can easily tell which version you are using
  (and so that you can build tools which support multiple versions!)

    Object.defineProperties ｍｅｒｍａｉｄ,

The `ℹ` property provides an identifying URI for the API author of this
  version of ｍｅｒｍａｉｄ.
If you fork ｍｅｒｍａｉｄ and change its API, you should also change
  this value.

      ℹ: value: "https://go.KIBI.family/mermaid/"

The `Nº` property provides the version number of this version of
  ｍｅｒｍａｉｄ, as an object with three parts: `major`, `minor`, and
  `patch`.
It is up to the API author (identified above) to determine how these
  parts should be interpreted.
It is recommended that the `toString()` and `valueOf()` methods be
  implemented as well.

      Nº: value: Object.freeze
        major: 0
        minor: 1
        patch: 0
        toString: -> "#{@major}.#{@minor}.#{@patch}"
        valueOf: -> @major * 100 + @minor + @patch / 100

##  How to Read This Source  ##

ｍｅｒｍａｉｄ is written in Literate CoffeeScript; this file is
  actually a part of the ｍｅｒｍａｉｄ source!
If you are new to Literate CoffeeScript, you might be surprised to find
  that the code blocks above are the actual source for those parts of
  the program.
The rest of the source files are structured in a similar way, mixing
  source code with documentation.

For those experienced in CoffeeScript, you might expect each file to be
  wrapped in a closure, with its own local variables.
However, the ｍｅｒｍａｉｄ build procedures stitch the source files
  together _prior_ to compilation.
That means that local variables declared in one file will be made
  available in later ones, but not to the global context as a whole.
See [Roost](https://github.com/marrus-sh/Roost) if you're curious about
  this process.

The style of CoffeeScript used in this source differs pretty
  significantly from what you might encounter elsewhere.
Stick with it, and you'll get the hang of it, and you can always
  [compile to JavaScript](https://coffeescript.org/#try) those parts
  that you do not understand.

##  Don't Be Confused!  ##

As you have probably already noticed, this source uses Unicode
  characters in some variable names.
The global variable, `ｍｅｒｍａｉｄ`, is written using fullwidth
  characters, and this is _not_ the same name `mermaid`, written using
  proportional (ASCII) ones.

The letter `U+01C0 ǀ LATIN LETTER DENTAL CLICK` is used to "namespace"
  names.
For example, all of the types defined by the XML Schema Definition
  Language specification have JavaScript constructors whose names start
  with `XSDǀ`.
This is _not_ the same character as `U+007C | VERTICAL LINE`, which
  will always appear in this source surrounded by spaces.

The letter `U+01C3 ǃ LATIN LETTER RETROFLEX CLICK` is used in function
  names to denote a function that either throws an error or returns
  `undefined`.
Frequently, this function is named `testǃ`.
This is _not_ the same character as `U+0021 ! EXCLAMATION MARK`, which
  will never appear in this source directly following a variable name.

The letter `U+02D0 ℙ DOUBLE-STRUCK CAPITAL P` is used in local
  variable names for prototypes; `Exampleℙ` provides the local name for
  `Example.prototype` (in CoffeeScript, `Example::`).

___

<details>
  <summary>License notice</summary>
  <p>This file is a part of ｍｅｒｍａｉｄ.</p>
  <p>ｍｅｒｍａｉｄ is free software: you can redistribute it and/or
    modify it under the terms of the GNU General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version. Similarly, you can
    redistribute and/or modify the documentation sections of this
    document under the terms of the Creative Commons
    Attribution-ShareAlike 4.0 International License.</p>
  <p>ｍｅｒｍａｉｄ is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
    General Public License for more details.</p>
  <p>You should have received copies of the GNU General Public License
    and the Creative Commons Attribution-ShareAlike 4.0 International
    License along with this source. If not, see
    https://www.gnu.org/licenses/ and
    https://creativecommons.org/licenses/by-sa/4.0/.</p>
</details>
