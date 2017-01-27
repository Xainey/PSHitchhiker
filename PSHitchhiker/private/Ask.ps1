function Ask
{
    [cmdletbinding()]
    param(
        [parameter(Mandatory = $False)]
        [string] $Question,
        [parameter(Mandatory = $False)]
        [string] $Format = "string"
    )

    if($Question -in ($null, ""))
    {
        return "Please ask a question."
    }

    $UltimateQuestion = "What is the answer to life, the universe, and everything?"

    if($Question -eq $UltimateQuestion)
    {
        switch ($Format)
        {
            string {
                return "Forty-Two."
            }
            integer {
                return 42
            }
            roman {
                return (Get-RomanNumeral -Number 42)
            }
            default {
                return "I do not know that format."
            }
        }
    }

    return (Get-RandomQuote)
}