$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'

# Since we match the srs/tests organization this works
$here = $here -replace 'tests', 'PSHitchhiker'

. "$here\$sut"

# Import our module to use InModuleScope
Import-Module (Resolve-Path ".\PSHitchhiker\PSHitchhiker.psm1") -Force

InModuleScope "PSHitchhiker" {
    Describe "Public/Ask" {
        Context "Known Answers" {
            It "doesnt like questionless questions" {
                Ask -Question "" | Should be "Please ask a question."
                Ask -Question $null | Should be "Please ask a question."
            }
            It "knows the answer to the ultimate question" {
                $UltimateQuestion = "What is the answer to life, the universe, and everything?"
                Ask -Question $UltimateQuestion | Should be "Forty-Two."
                Ask -Question $UltimateQuestion -Format Roman | Should be "XLII"
                Ask -Question $UltimateQuestion -Format Integer | Should be 42
            }
        }
        Context "Random Answers" {
            Mock Get-RandomQuote { return "Science." } -Verifiable
            It "returns a random answer for unknown questions" {
                Ask -Question "Why is pie delicious?" | Should be "Science."
                Assert-VerifiableMocks
            }
        }
    }
}