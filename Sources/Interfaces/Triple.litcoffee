<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/Interfaces/Triple.litcoffee</code>
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

#  Triples  #

>   Reference specifications:
>   + <https://www.w3.org/TR/rdf-interfaces/#triples>
>   + <http://rdf.js.org/#triple-interface>

A `Triple` is a kind of `Quad` where the `graph` is mandated to be a
  `DefaultGraph`.
Because of this, `Triple`s can be easily converted into N-Triples
  notation (which cannot support quads).

##  The Constructor  ##

The `Triple` constructor takes three arguments:

+ __`subject` :__
  A `NamedNode` or `BlankNode`.

+ __`predicate` :__
  A `NamedNode`.

+ __`object` :__
  A `NamedNode`, `Literal`, or `BlankNode`.

This is more restrictive than `Quad`.

    Triple = (subject, predicate, object) ->
      constructǃ @, Quad, "Quad"
      throw new TypeError "Invalid subject." unless (
        subject instanceof NamedNode or
        subject instanceof BlankNode
      )
      throw new TypeError "Invalid predicate." unless (
        predicate instanceof NamedNode
      )
      throw new TypeError "Invalid object." unless (
        object instanceof NamedNode or
        object instanceof Literal or
        object instanceof BlankNode
      )
      Quad.call @, subject, predicate, object

##  The Prototype  ##

The `Triple` prototype inherits from `Quad`.

    Object.defineProperty Triple, "prototype",
      writable: no
      value: Object.defineProperties Tripleℙ = (Object.create Quadℙ),

##  Instance Methods  ##

###  `triple.constructor()`:

`Triple`s are not constructable by outside forces, so the
  `constructor()` method is a fake constructor which always throws a
  `TypeError`.

        constructor: value: Ø "Triple", Tripleℙ

###  `triple.toString()`:

The `toString()` method returns the triple as an N-Triple.

        toString: value: ->
          return Object::toString.call @ unless (
            typeof (subjectNT = @?.subject?.toNT) is "function" and
            typeof (predicateNT = @?.predicate?.toNT) is "function" and
            typeof (objectNT = @?.objectNT?.toNT) is "function"
          )
          "#{do subjectNT} #{do predicateNT} #{do objectNT} ."

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
