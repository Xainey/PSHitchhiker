function Get-RandomQuote
{
    $quotes =
    "Don't Panic.",
    "Would it save you a lot of time if I just gave up and went mad now?",
    "Time is an illusion. Lunchtime doubly so.",
    "Isn't it enough to see that a garden is beautiful without having to believe that there are fairies at the bottom of it too?",
    "The ships hung in the sky in much the same way that bricks don't.",
    "I'd far rather be happy than right any day.",
    "For a moment, nothing happened. Then, after a second or so, nothing continued to happen."

    return $quotes | Get-Random
}