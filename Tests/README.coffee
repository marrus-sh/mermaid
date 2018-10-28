{ expect } = require "chai"
global = require "../Build/mermaid.js"

describe "ｍｅｒｍａｉｄ", ->

  it "exists", ->
    (expect global).has.ownProperty "ｍｅｒｍａｉｄ"

  it "can't be constructed", ->
    proto = Object.getPrototypeOf global.ｍｅｒｍａｉｄ
    (expect proto.constructor).throws

  it "is available on all properties", ->
    MERPERSON = "\u{1F9DC}"
    FEMALE = "\u2640"
    VS16 = "\uFE0F"
    WAVE = "\u{1F30A}"
    ZWJ = "\u200D"
    for property in [
      "#{MERPERSON}#{WAVE}"
      "#{MERPERSON}#{ZWJ}#{FEMALE}#{VS16}#{WAVE}"
    ]
      (expect global).has.ownProperty property
      (expect global[property]).equals global.ｍｅｒｍａｉｄ

  it "disallows boys", ->
    MALE = "\u2642"
    MERPERSON = "\u{1F9DC}"
    VS16 = "\uFE0F"
    WAVE = "\u{1F30A}"
    ZWJ = "\u200D"
    property = "#{MERPERSON}#{ZWJ}#{MALE}#{VS16}#{WAVE}"
    (expect global).has.ownProperty property
    (expect global).has.ownPropertyDescriptor property,
      configurable: no
      enumerable: no
      writable: no
      value: null

  describe "§ Identity", ->
    { ｍｅｒｍａｉｄ } = global
    packageVersion = process.env.npm_package_version
    [ major, minor, patch ] = packageVersion.split "."

    it "has the correct API ID", ->
      (expect ｍｅｒｍａｉｄ).has.ownProperty "ℹ"
      (expect ｍｅｒｍａｉｄ.ℹ).equals "
        https://go.KIBI.family/mermaid/
      "
    it "has the correct version", ->
      (expect ｍｅｒｍａｉｄ).has.ownProperty "Nº"
      (expect ｍｅｒｍａｉｄ.Nº).has.ownProperty "major"
      (expect ｍｅｒｍａｉｄ.Nº.major).equals +major
      (expect ｍｅｒｍａｉｄ.Nº).has.ownProperty "minor"
      (expect ｍｅｒｍａｉｄ.Nº.minor).equals +minor
      (expect ｍｅｒｍａｉｄ.Nº).has.ownProperty "patch"
      (expect ｍｅｒｍａｉｄ.Nº.patch).equals +patch
      (expect "#{ｍｅｒｍａｉｄ.Nº}").equals packageVersion
      (expect +ｍｅｒｍａｉｄ.Nº).equals +major * 100 + (+minor) +
        +patch / 100
