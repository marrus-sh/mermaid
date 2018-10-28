{ build , clear , configure , watch } = require 'Roost'

#  See <https://github.com/marrus-sh/Roost> for the meaning of this
#    configuration.
configure
  destination: "Build/"
  literate: yes
  name: "mermaid"
  order: [
    "README"
    "IETF/RFC3987"
    "IETF/BCP47"
    "Interfaces/Term"
    "Interfaces/RDFNode"
    "Interfaces/NamedNode"
    "Interfaces/BlankNode"
    "Interfaces/Literal"
    "Interfaces/Variable"
    "Interfaces/DefaultGraph"
    "Interfaces/Quad"
    "Interfaces/Triple"
    "Interfaces/DataFactory"
    "Interfaces/ωSETUP"
  ]
  preamble: "README.js"
  prefix: "Sources/"
  suffix: ".litcoffee"

task "build", "build ｍｅｒｍａｉｄ", build
task "watch", "build ｍｅｒｍａｉｄ and watch for changes", watch
task "clear", "remove built files", clear
