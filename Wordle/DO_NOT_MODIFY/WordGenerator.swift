//
//  WordGenerator.swift
//  Wordle
//
//  Created by Mari Batilando on 2/20/23.
//

import Foundation

enum WordTheme: String {
  case normal, mario, pokemon
  
  func possibleWords(numLetters: Int) -> [String] {
    switch self {
    case .normal:
      return normalWords(with: numLetters)
    case .mario:
      return marioWords(with: numLetters)
    case .pokemon:
      return pokemonWords(with: numLetters)
    }
  }
  
  func normalWords(with numLetters: Int) -> [String] {
    if numLetters == kMinLetters {
      return ["SEED", "GOAT", "LOAD"]
    } else if numLetters == kMinLetters + 1 {
      return ["GRAPE", "SMART", "PIZZA"]
    } else if numLetters == kMinLetters + 2 {
      return ["PENCIL", "COFFEE", "ROCKET"]
    } else if numLetters == kMaxLetters {
      return ["BICYCLE", "WEEKEND", "LIBRARY"]
    }
    return []
  }
  
  func marioWords(with numLetters: Int) -> [String] {
    if numLetters == kMinLetters {
      return ["JUMP", "PIPE", "TOAD", "FLAG", "KART", "BOOS", "KONG", "WARP"]
    } else if numLetters == kMinLetters + 1 {
      return ["MARIO", "LUIGI", "PEACH", "DAISY", "WARIO", "WORLD", "SUPER", "YOSHI", "KOOPA", "BIRDO", "WHOMP", "CAPPY", "DIDDY"]
    } else if numLetters == kMinLetters + 2 {
      return ["BOWSER", "GOOMBA", "THWOMP", "DONKEY", "BOBOMB", "CASTLE"]
    } else if numLetters == kMaxLetters {
      return ["WALUIGI", "DRMARIO", "TANOOKI", "KINGDOM", "POWERUP", "ITALIAN"]
    }
    return []
  }
  
  func pokemonWords(with numLetters: Int) -> [String] {
    if numLetters == kMinLetters {
      return ["POKE", "BALL", "JINX", "ONIX", "ABRA", "SAWK", "UXIE", "SNOM", "XATU", "AXEW", "HOOH"]
    } else if numLetters == kMinLetters + 1 {
      return ["EEVEE", "MARIL", "LUGIA", "SNIVY", "PICHU", "RALTS", "HOOPA", "UNOWN", "DEINO", "ROTOM", "ABSOL", "DITTO"]
    } else if numLetters == kMinLetters + 2 {
      return ["CUBONE", "GASTLY", "ARCEUS", "ZAPDOS", "LITTEN", "ROWLET", "MUDKIP", "PIDGEY", "PIPLUP", "FLYGON", "MELTAN", "SKITTY"]
    } else if numLetters == kMaxLetters {
      return ["PIKACHU", "TRAINER", "POKEMON", "IVYSAUR", "JIRACHI", "VICTINI", "DUGTRIO", "BISHARP"]
    }
    return []
  }
}

class WordGenerator {
  static func generateGoalWord(with theme: WordTheme) -> [String] {
    let numLetters = SettingsManager.shared.settingsDictionary[kNumLettersKey] as! Int
    let randomWord = theme.possibleWords(numLetters: numLetters).randomElement()!
    return randomWord.map { String($0) }
  }
}

