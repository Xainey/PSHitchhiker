$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'

#since we match the srs/tests organization this works
$here = $here -replace 'tests', 'PSHitchhiker'

. "$here\$sut"

# Import our module to use InModuleScope
Import-Module (Resolve-Path ".\PSHitchhiker\PSHitchhiker.psm1") -Force

InModuleScope "PSHitchhiker" {
    Describe "Public/Invoke-PSHitchhiker" {
        Context "Ask" {
            It "Asks a question" {
                {Invoke-PSHitchhiker -Ask "Is the cake a lie?" } | Should Not Throw
            }
            It "specifies a format" {
                {Invoke-PSHitchhiker -Ask "Is the cake a lie?" -Format integer } | Should Not Throw
            }
        }
        Context "Help" {
            It "gets the docs" {
                {Invoke-PSHitchhiker -Help } | Should Not Throw
            }
        }
    }
}