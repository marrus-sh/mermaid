<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/Interfaces/Term.litcoffee</code>
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

#  RDF Terms  #

>   Reference specifications:
>   + <http://rdf.js.org/#term-interface>

A `Term` is an RDF "thing"; it can be a node, a literal, a variable, or
  a graph.
These are given the interfaces `NamedNode`, `BlankNode`, `Literal`,
  `Variable`, and `DefaultGraph`.

The constants `NAMED_NODE`,  `BLANK_NODE`, `LITERAL`, `VARIABLE`, and
  `DEFAULT_GRAPH` provide numeric identifiers for the different node
  types—this is a ｍｅｒｍａｉｄ extension.
`RDF_NODE` can be used to match any `RDFNode`.

    Object.defineProperties ｍｅｒｍａｉｄ,
      RDF_NODE:      value: RDF_NODE      = 0b000001
      NAMED_NODE:    value: NAMED_NODE    = 0b000011
      BLANK_NODE:    value: BLANK_NODE    = 0b000101
      LITERAL:       value: LITERAL       = 0b001001
      VARIABLE:      value: VARIABLE      = 0b010000
      DEFAULT_GRAPH: value: DEFAULT_GRAPH = 0b100000

ｍｅｒｍａｉｄ uses the internal `termTypes` variable to keep track of
  the strings associated with each constant.

    termTypes =
      [RDF_NODE]: "RDFNode"
      [NAMED_NODE]: "NamedNode"
      [BLANK_NODE]: "BlankNode"
      [LITERAL]: "Literal"
      [VARIABLE]: "Variable"
      [DEFAULT_GRAPH]: "DefaultGraph"

Terms are not _represented_ in ｍｅｒｍａｉｄ so much as they are
  _described_:
Multiple (distinct) JavaScript objects might describe the same RDF
  term.
Be sure to use the `equals()` method on terms, and not the `==` or
  `===` operators to compare them.

The `Term` interface provides an abstract constructor and prototype
  for RDF terms.
It is extended to create the constructors and prototypes for
  `RDFNode`, `Variable`, and `DefaultGraph`.
However, `Term` itself is not made available to the `ｍｅｒｍａｉｄ`
  object, and no objects should directly inherit from it on their
  prototype chain.

##  The Constructor  ##

The `Term` constructor takes two arguments:

+   __`type` :__
    One of the term type constants defined above.

+   __`value` :__
    The string value of the term.

    Term = (type, value) ->
      constructǃ @, Term, "Term"

##  Instance Properties  ##

      Object.defineProperties @,

###  `term.interfaceType`:

The `interfaceType` property gives the term type constant for this
  term, as a positive integer.
This is a ｍｅｒｍａｉｄ extension.

        interfaceType:
          configurable: yes
          enumerable: yes
          writable: no
          value: type >>> 0

###  `term.termType`:

The `termType` property gives the string value which corresponds to the
  term's `interfaceType`.

        termType:
          configurable: yes
          enumerable: yes
          get: -> termTypes[@interfaceType >>> 0]

###  `term.value`:

The `value` property gives the string representation of the term's
  value.

        value:
          configurable: yes
          enumerable: yes
          writable: no
          value: if value? then do value.toString else String value

##  The Prototype  ##

The `Term` prototype defines common methods which one can expect to
  find on any term.
However, the exact implementation of these methods may be overshadowed
  by more specific term constructors.

    Object.defineProperty Term, "prototype",
      writable: no
      value: Object.defineProperties Termℙ = {},

##  Instance Methods  ##

###  `term.constructor()`:

`Term`s are not constructable by outside forces, so the
  `constructor()` method is a fake constructor which always throws a
  `TypeError`.

        constructor: value: Ø "Term", Termℙ

###  `term.equals(other)`:

The `equals()` method attempts to determine if two `Term`s are
  equivalent.
To do this, it simply compares the two `Term` properties to see if
  they match.

        equals: value: (other) ->
          return (
            @interfaceType is other.interfaceType and
            @value is other.value
          ) if @ instanceof Term and other instanceof Term

If exactly one of `this` or `other` is not a `Term`, a strict
  equality check is done with the value of term's `toValue()` method,
  instead.

          if @ instanceof Term ^ other instanceof Term
            term = if @ instanceof Term then @ else other
            value = if @ is term then other else @
            return value is do term.toValue

If both `this` and `other` are `null` or `undefined`, they are
  considered equal.
Otherwise, `equals()` just does a straightforward strict equality
  check.

          !@? and !other? or @ is other

###  `term.toString()`:

The `toString()` method returns the string representation of the term's
  `value` property.
However, this method may be overshadowed by more specific term
  interfaces.

        toString: value: ->
          if (value = @?.value)? then do value.toString
          else String value

###  `term.valueOf()`:

The `valueOf()` method is identical to `toString()` for generic
  `Term`s, but may be different for more specific node interfaces.

        valueOf: value: Termℙ.toString

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
