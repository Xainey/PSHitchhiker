<#
    .SYNOPSIS
        Asks DeepThought a Question.

    .DESCRIPTION
        Asks DeepThought a Question.
        You can ask questions and request a specific return format.

    .PARAMETER Ask
        You can ask questions and request a specific return format.

    .PARAMETER Help
        Just a minor wrapper to call Get-Help or further customize

    .EXAMPLE
        Invoke-PSHitchhiker -Ask "Why is my cereal on fire?"

    .NOTES
#>
function Invoke-PSHitchhiker
{
    [cmdletbinding(DefaultParameterSetName="Help")]
    param(
        #Help
        [Parameter(Mandatory=$False, ParameterSetName="Help")]
        [switch] $Help,

        # Ask
        [Parameter(Mandatory=$True, ParameterSetName="Ask")]
        [switch] $Ask,
        [string] $Format,
        [Parameter(Mandatory=$True, ParameterSetName="Ask", Position=0)]
        [string] $Question
    )

    # Remove Switch for ParmameterSetName
    $PSBoundParameters.Remove($PsCmdlet.ParameterSetName)

    # Call Functon with Bound Parms
    . $PsCmdlet.ParameterSetName @PSBoundParameters
}