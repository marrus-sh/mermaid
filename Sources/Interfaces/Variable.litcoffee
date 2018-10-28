<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/Interfaces/Variable.litcoffee</code>
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

#  Variables  #

>   Reference specifications:
>   + <http://rdf.js.org/#variable-interface>

Variables may be described using `Variable`s.

##  The Constructor  ##

The `Variable` constructor takes one argument, `name`, which provides
  the name of the variable.

    Variable = (name) ->
      constructǃ @, Variable, "Variable"

`Variable` extends `Term`.

      value = if name? then do name.toString else String name
      Term.call @, VARIABLE, value

##  The Prototype  ##

The `Variable` prototype inherits from `Term`.

    Object.defineProperty NamedNode, "prototype",
      writable: no
      value: Object.defineProperties Variableℙ = (Object.create Termℙ),

##  Instance Methods  ##

###  `variable.constructor()`:

`Variable`s are not constructable by outside forces, so the
  `constructor()` method is a fake constructor which always throws a
  `TypeError`.

        constructor: value: Ø "Variable", Variableℙ

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
