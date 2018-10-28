{ expect } = require "chai"
global = require "../Build/mermaid.js"

describe "ｍｅｒｍａｉｄ", ->
  it "exists", ->
    (expect global).has.ownProperty "ｍｅｒｍａｉｄ"
