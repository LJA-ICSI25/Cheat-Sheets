function Separator { Write-Host "======================================================" -ForegroundColor Cyan }
function Pause-Line($s=2) { Start-Sleep -Seconds $s }
function Show-Cat {
    Write-Host ""
    Write-Host " /\_/\ " -ForegroundColor Yellow
    Write-Host "( o.o )" -ForegroundColor Yellow
    Write-Host " > ^ < " -ForegroundColor Yellow
    Write-Host ""
}
function Type-Text($text, $delay = 0.02) {
    $text.ToCharArray() | ForEach-Object {
        Write-Host -NoNewline $_
        Start-Sleep -Milliseconds ($delay * 1000)
    }
    Write-Host ""
}

# Random positive comments
$Compliments = @(
    "You're clawing your way to victory, nice!",
    "That was purr-fect!",
    "You're as clever as a Siamese!",
    "Impressive instincts, ${player}!",
    "You must have nine lives of wisdom!",
    "That was smoother than a cat’s fur!",
    "Your curiosity truly pays off!"
)

# Levels
$levels = @(
    @{ Clue = "Round 1: What do cats chase with tiny paws and big energy?"; Answer = "mouse" },
    @{ Clue = "Round 2: The humming sound cats make"; Answer = "purring" },
    @{ Clue = "Round 3: A cat’s favorite hobby — even more than eating."; Answer = "sleep" },
    @{ Clue = "Round 4: Sharp, retractable tools of the feline trade."; Answer = "claws" },
    @{ Clue = "Round 5: A fishy snack that makes tails wag."; Answer = "tuna" },
    @{ Clue = "Round 6: Where cats somehow fit no matter the size."; Answer = "box" },
    @{ Clue = "Round 7: Where your cat sits when you’re typing."; Answer = "keyboard" },
    @{ Clue = "Round 8: The place cats ruled in ancient legends."; Answer = "egypt" },
    @{ Clue = "Round 9: What does a cat use to clean itself?"; Answer = "tongue" },
    @{ Clue = "Round 10: What mythical creature is half cat, half bread? (Internet meme!)"; Answer = "nyancat" }
)

# --- Intro ---
Clear-Host
Separator
Write-Host "🐱 WELCOME TO THE ULTIMATE CAT PASSWORD ADVENTURE 🐱" -ForegroundColor Magenta
Separator
Pause-Line 2
Show-Cat
Type-Text "In a digital world ruled by felines, only the true cat whisperer can solve the secrets..."
Pause-Line 2

$player = Read-Host -Prompt "Before we begin, traveler, tell us your name"
Clear-Host
Write-Host "Greetings, ${player}! The cats have been expecting you." -ForegroundColor Green
Show-Cat
Pause-Line 2
Type-Text "To prove your worth, you must pass ten sacred cat trials..."
Pause-Line 2
Type-Text "Each question is a password of the cat kingdom. Fail, and the cats will nap without mercy."
Pause-Line 3
Write-Host ""
Write-Host "Ready to begin? (yes/no)" -ForegroundColor White
$response = Read-Host
if ($response.ToLower() -ne "yes") {
    Write-Host "The cats yawn and curl back to sleep... Maybe next time." -ForegroundColor DarkGray
    exit
}

# --- Main Game ---
function Play-Game {
    param([string]$player)
    $score = 0
    $levelNum = 1

    foreach ($lvl in $levels) {
        Clear-Host
        Separator
        Write-Host "ROUND $levelNum of $($levels.Count)" -ForegroundColor Yellow
        Separator
        Show-Cat
        Type-Text $lvl.Clue
        Write-Host ""
        $tries = 0
        $maxTries = 5
        $correct = $false

        while (-not $correct -and $tries -lt $maxTries) {
            $guess = Read-Host -Prompt "Enter your answer"
            $tries++
            if ($guess.ToLower() -eq $lvl.Answer.ToLower()) {
                $correct = $true
                $score++
                Write-Host ""
                $randomComment = Get-Random $Compliments
                Write-Host "✅ $randomComment" -ForegroundColor Green
                Pause-Line 2
            } else {
                Write-Host "❌ Wrong! You have $($maxTries - $tries) tries left." -ForegroundColor Red
                if ($tries -lt $maxTries) {
                    Write-Host "Keep trying! You got this!" -ForegroundColor DarkCyan
                }
                Pause-Line 1
            }
        }

        if (-not $correct) {
            Write-Host ""
            Write-Host "😿 You failed this round, ${player}. The correct answer was '$($lvl.Answer)'." -ForegroundColor DarkRed
            Write-Host ""
            Write-Host "Final Score: $score / $($levels.Count)" -ForegroundColor Yellow
            Show-Cat
            Pause-Line 2
            Ask-Retry
            return
        }

        if ($levelNum -lt $levels.Count) {
            Write-Host ""
            Write-Host "Preparing next trial..." -ForegroundColor Cyan
            Start-Sleep -Seconds 2
        }

        $levelNum++
    }

    # --- Game Complete ---
    Clear-Host
    Separator
    Write-Host "🎉 CONGRATULATIONS, ${player}! YOU'VE COMPLETED THE CAT REALM! 🎉" -ForegroundColor Yellow
    Separator
    Show-Cat
    Write-Host ""
    Write-Host "Your final score: $score / $($levels.Count)" -ForegroundColor Cyan
    Pause-Line 2

    if ($score -eq $levels.Count) {
        Type-Text "The cats purr approvingly..."
        Pause-Line 2
        Type-Text "You have earned the final secret."
        Pause-Line 1
        Write-Host ""
        Write-Host "🐾 The answer is the name of my cat, yes you can find it." -ForegroundColor Magenta
    }
    else {
        Write-Host ""
        Write-Host "😿 You finished the trials, but not with a perfect score." -ForegroundColor DarkRed
        Write-Host "The cats turn their tails... perhaps next time you'll impress them all." -ForegroundColor Gray
    }

    Pause-Line 3
    Write-Host ""
    Write-Host "Would you like to play again? (yes/no)" -ForegroundColor White
    $choice = Read-Host
    if ($choice.ToLower() -eq "yes") {
        Play-Game -player $player
    } else {
        Write-Host ""
        Write-Host "Farewell, ${player}. The cats will await your return." -ForegroundColor Green
        Show-Cat
        Pause-Line 2
        exit
    }
}

# --- Retry Function ---
function Ask-Retry {
    Write-Host ""
    Write-Host "Would you like to try again? (yes/no)" -ForegroundColor White
    $retry = Read-Host
    if ($retry.ToLower() -eq "yes") {
        Play-Game -player $player
    } else {
        Write-Host ""
        Write-Host "The cats nod solemnly. Until next time, ${player}..." -ForegroundColor Gray
        Show-Cat
        Pause-Line 2
        exit
    }
}

# --- Start the Game ---
Play-Game -player $player


