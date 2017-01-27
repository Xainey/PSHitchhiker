$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$here = $here -replace 'tests', 'PSHitchhiker'
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'

. "$here\$sut"

Describe "Get-RomanNumeral" {
  Context "Simple Calculations" {
      It "Calculates the Roman Numeral for 1" {
          Get-RomanNumeral -Number 1 | Should be "I"
      }
      It "Calculates the Roman Numeral for 2" {
          Get-RomanNumeral -Number 2 | Should be "II"
      }
      It "Calculates the Roman Numeral for 4" {
          Get-RomanNumeral -Number 4 | Should be "IV"
      }
      It "Calculates the Roman Numeral for 5" {
          Get-RomanNumeral -Number 5 | Should be "V"
      }
      It "Calculates the Roman Numeral for 6" {
          Get-RomanNumeral -Number 6 | Should be "VI"
      }
      It "Calculates the Roman Numeral for 9" {
          Get-RomanNumeral -Number 9 | Should be "IX"
      }
      It "Calculates the Roman Numeral for 10" {
          Get-RomanNumeral -Number 10 | Should be "X"
      }
      It "Calculates the Roman Numeral for 11" {
          Get-RomanNumeral -Number 11 | Should be "XI"
      }
      It "Calculates the Roman Numeral for 20" {
          Get-RomanNumeral -Number 20 | Should be "XX"
      }
      It "Calculates the Roman Numeral for 50" {
          Get-RomanNumeral -Number 50 | Should be "L"
      }
      It "Calculates the Roman Numeral for 100" {
          Get-RomanNumeral -Number 100 | Should be "C"
      }
      It "Calculates the Roman Numeral for 500" {
          Get-RomanNumeral -Number 500 | Should be "D"
      }
      It "Calculates the Roman Numeral for 1000" {
          Get-RomanNumeral -Number 1000 | Should be "M"
      }
    }
    Context "Complex Calculations" {
        It "Calculates the Roman Numeral for 1999" {
            Get-RomanNumeral -Number 1999 | Should be "MCMXCIX"
        }
        It "Calculates the Roman Numeral for 4990" {
            Get-RomanNumeral -Number 4990 | Should be "MMMMCMXC"
        }
    }
}