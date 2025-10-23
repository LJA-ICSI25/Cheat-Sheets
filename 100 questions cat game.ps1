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
$player = Read-Host -Prompt "Before we begin, traveler, tell us your name"

$Compliments = @(
"You're clawing your way to victory, nice!",
"That was purr-fect!",
"You're as clever as a Siamese!",
"Impressive instincts, ${player}!",
"You must have nine lives of wisdom!",
"That was smoother than a cat’s fur!",
"Your curiosity truly pays off!",
"Feline finesse! Well done!",
"You’re scratching the surface of greatness!",
"Meow-gnificent effort!",
"Paws-itively brilliant!",
"Whisker-twitching victory!",
"Cat-tastic job, ${player}!",
"Your agility impresses the cats!",
"You’ve got the purr-sonality of a champion!",
"You’re a fur-bulous solver!",
"That answer had the stealth of a cat!",
"Tail up! You’re doing amazing!",
"Pounce on success, that’s you!",
"You’ve earned the cats’ respect!",
"A true cat whisperer at work!",
"Fur real, that was great!",
"Sharp as a cat’s claw!",
"Sleek, smart, and victorious!",
"You’ve got nine lives of skill!",
"That was a meow-nificent move!",
"Cat-ching all the answers like a pro!",
"You’re the king/queen of this cat castle!",
"Purrrhaps you’re destined for greatness!",
"Every cat would knead in approval!",
"Kitty-tastic work!",
"Fur-tunately, you got it right!",
"Claw-some answer!",
"Purr-fessional solving skills!",
"Meow-velous!",
"You’ve got the purr-fect instincts!",
"Whisker your way to victory!",
"Feline genius at work!",
"Cat-chy performance!",
"Tail twitching in excitement!",
"Paws and reflect — perfect!",
"Nine lives of accuracy!",
"Cat-astrophically good!",
"Fur real, outstanding!",
"Purr-haps you’re the chosen one!",
"Claw-ver thinking!",
"Whisker wonder!",
"You’ve scratched the surface brilliantly!",
"Purr-sonal best!",
"Cat-champion moves!",
"You’re feline fine!",
"Meow-ster of all answers!",
"Pawsome intuition!",
"Tail-flipping good job!",
"Fur-bulous instincts!",
"Claw-some effort, ${player}!",
"Whiskers up! Correct!",
"Purrfection achieved!",
"Kitten around? No, you nailed it!",
"Feline finesse unlocked!",
"Meow-nificent answer!",
"Paw-sitively sharp!",
"Tail tip of approval!",
"Nine lives of correctness!",
"Clawing your way to glory!",
"Fur-tunate guess!",
"Purr-haps a cat whisperer!",
"Meow-gical thinking!",
"Cat-ching the answers fast!",
"Whisker wizardry!",
"Fur-ocious intelligence!",
"Paw-some reflexes!",
"Tail tip of excellence!",
"Claw-ver paws!",
"Meow-velous instincts!",
"Purr-sonal genius!",
"Feline intuition at max!",
"Kitty claws up!",
"Purr-fectly done!",
"Tail twitching mastery!",
"Nine lives of brilliance!",
"Cat-tastic intuition!",
"Whisker sharpness!",
"Paws and repeat success!",
"Fur-ever impressed!",
"Claw-some knowledge!",
"Meow-gnificent accuracy!",
"Purr-fect score potential!",
"Tail of triumph!",
"Paw-sitively correct!",
"Feline grace and intelligence!",
"Whiskers in agreement!",
"Claw-some victory, ${player}!",
"Meow-tastic performance!",
"Purr-sonal triumph!",
"Kitten genius at work!",
"Fur real, amazing!",
"Paw-some precision!",
"Tail flip of glory!",
"Purr-fect instincts!",
"Claw-some mastery!",
"Meow-velous achievement!"
)

$levels = @(
    @{ Clue = "Round 1: What do cats chase with tiny paws and big energy?"; Answer = "mouse" },
    @{ Clue = "Round 2: The soothing sound of contentment."; Answer = "purr" },
    @{ Clue = "Round 3: A cat’s favorite hobby — even more than eating."; Answer = "sleep" },
    @{ Clue = "Round 4: Sharp, retractable tools of the feline trade."; Answer = "claws" },
    @{ Clue = "Round 5: A fishy snack that makes tails wag."; Answer = "tuna" },
    @{ Clue = "Round 6: Where cats somehow fit no matter the size."; Answer = "box" },
    @{ Clue = "Round 7: Where your cat sits when you’re typing."; Answer = "keyboard" },
    @{ Clue = "Round 8: The place cats ruled in ancient legends."; Answer = "egypt" },
    @{ Clue = "Round 9: What does a cat use to clean itself?"; Answer = "tongue" },
    @{ Clue = "Round 10: What mythical creature is half cat, half bread?"; Answer = "nyancat" },
    @{ Clue = "Round 11: Sound of a kitten’s tiny meow."; Answer = "mew" },
    @{ Clue = "Round 12: Cats love to bat at this stringy toy."; Answer = "yarn" },
    @{ Clue = "Round 13: Favorite sunny resting spot."; Answer = "sunbeam" },
    @{ Clue = "Round 14: Common term for cat hairballs."; Answer = "furball" },
    @{ Clue = "Round 15: A feline marking territory with scent."; Answer = "rub" },
    @{ Clue = "Round 16: Object cats pounce on for fun."; Answer = "feather" },
    @{ Clue = "Round 17: Hiding spot for shy cats."; Answer = "closet" },
    @{ Clue = "Round 18: Pattern often seen on a tabby."; Answer = "stripe" },
    @{ Clue = "Round 19: A favorite small crunchy treat."; Answer = "kibble" },
    @{ Clue = "Round 20: A warm, human-powered device they sit on."; Answer = "laptop" },
    @{ Clue = "Round 21: Whiskers help measure this."; Answer = "space" },
    @{ Clue = "Round 22: Soft material for bedding."; Answer = "blanket" },
    @{ Clue = "Round 23: Fast little bug for cats to chase."; Answer = "insect" },
    @{ Clue = "Round 24: Favorite furniture to scratch."; Answer = "sofa" },
    @{ Clue = "Round 25: Furry or stringy toy for chasing."; Answer = "toy" },
    @{ Clue = "Round 26: Nighttime feline activity."; Answer = "prowling" },
    @{ Clue = "Round 27: Cartoon cat who loves lasagna."; Answer = "garfield" },
    @{ Clue = "Round 28: Rubbing against this body part."; Answer = "knee" },
    @{ Clue = "Round 29: High sunny perch."; Answer = "shelf" },
    @{ Clue = "Round 30: Internet-famous grumpy cat."; Answer = "grumpycat" },
    @{ Clue = "Round 31: Cats’ favorite liquid snack."; Answer = "milk" },
    @{ Clue = "Round 32: A feline hiding in paper."; Answer = "bag" },
    @{ Clue = "Round 33: Cats love this type of box inside homes."; Answer = "cardboard" },
    @{ Clue = "Round 34: Cat ninja move to sneak silently."; Answer = "pounce" },
    @{ Clue = "Round 35: Cats sharpen these on posts."; Answer = "claws" },
    @{ Clue = "Round 36: Cats lick this to groom fur."; Answer = "tongue" },
    @{ Clue = "Round 37: Cats’ night vision organ."; Answer = "eye" },
    @{ Clue = "Round 38: Feline body part for balance."; Answer = "tail" },
    @{ Clue = "Round 39: Cats hide in these for fun."; Answer = "curtain" },
    @{ Clue = "Round 40: Furry friends that purr alongside cats."; Answer = "kitten" },
    @{ Clue = "Round 41: Cats' favorite perch on furniture."; Answer = "armrest" },
    @{ Clue = "Round 42: Cats’ tiny feet pads."; Answer = "paw" },
    @{ Clue = "Round 43: Feline fascination with moving dots."; Answer = "laser" },
    @{ Clue = "Round 44: Soft, sleeping spot for cats."; Answer = "cushion" },
    @{ Clue = "Round 45: Cats stretch by extending front and back legs in a…"; Answer = "yawn" },
    @{ Clue = "Round 46: Cats rub against this to show affection."; Answer = "cheek" },
    @{ Clue = "Round 47: Hairless cat breed."; Answer = "sphynx" },
    @{ Clue = "Round 48: Cats love this type of plant."; Answer = "catnip" },
    @{ Clue = "Round 49: Famous internet box-loving cat."; Answer = "maru" },
    @{ Clue = "Round 50: Cats often chase their own…"; Answer = "tail" },
    @{ Clue = "Round 51: Cats’ favorite cozy spot."; Answer = "pillow" },
    @{ Clue = "Round 52: Cats sharpen claws on this."; Answer = "post" },
    @{ Clue = "Round 53: Cats’ stealthy hunting mode."; Answer = "stalk" },
    @{ Clue = "Round 54: Cat breed with folded ears."; Answer = "scottishfold" },
    @{ Clue = "Round 55: Cats love this fish."; Answer = "salmon" },
    @{ Clue = "Round 56: Cats climb this furniture item."; Answer = "tree" },
    @{ Clue = "Round 57: Cats’ whisker location."; Answer = "face" },
    @{ Clue = "Round 58: Cats’ favorite toy with feathers."; Answer = "wand" },
    @{ Clue = "Round 59: Cats make this sound when upset."; Answer = "hiss" },
    @{ Clue = "Round 60: Cats’ favorite hiding place outside."; Answer = "bush" },
    @{ Clue = "Round 61: Cats jump with…"; Answer = "grace" },
    @{ Clue = "Round 62: Cats love this bedding material."; Answer = "fleece" },
    @{ Clue = "Round 63: Cats’ tail fur pattern."; Answer = "ring" },
    @{ Clue = "Round 64: Cats rub this to mark territory."; Answer = "chin" },
    @{ Clue = "Round 65: Cats enjoy this small toy."; Answer = "ball" },
    @{ Clue = "Round 66: Cat nap location."; Answer = "lap" },
    @{ Clue = "Round 67: Cats use this to open doors."; Answer = "paw" },
    @{ Clue = "Round 68: Cat breed with long hair."; Answer = "persian" },
    @{ Clue = "Round 69: Cats groom each other using…"; Answer = "tongue" },
    @{ Clue = "Round 70: Cats’ hunting instinct targets…"; Answer = "bird" },
    @{ Clue = "Round 71: Cats scratch this type of furniture."; Answer = "chair" },
    @{ Clue = "Round 72: Famous cat who sleeps in cardboard boxes."; Answer = "maru" },
    @{ Clue = "Round 73: Cats make this when content."; Answer = "purr" },
    @{ Clue = "Round 74: Cats’ claws are…"; Answer = "retractable" },
    @{ Clue = "Round 75: Cats love this canned food."; Answer = "sardine" },
    @{ Clue = "Round 76: Cats’ best outdoor hiding place."; Answer = "tree" },
    @{ Clue = "Round 77: Cats’ flexible backbone allows…"; Answer = "stretch" },
    @{ Clue = "Round 78: Cats’ playful jump."; Answer = "leap" },
    @{ Clue = "Round 79: Cats love this hanging toy."; Answer = "string" },
    @{ Clue = "Round 80: Cats have this type of vision."; Answer = "night" },
    @{ Clue = "Round 81: Cats’ favorite warm device."; Answer = "heater" },
    @{ Clue = "Round 82: Cats’ resting posture."; Answer = "loaf" },
    @{ Clue = "Round 83: Cats’ sound for warning."; Answer = "growl" },
    @{ Clue = "Round 84: Cats’ favorite perch on window."; Answer = "sill" },
    @{ Clue = "Round 85: Cats’ favorite scratching surface."; Answer = "carpet" },
    @{ Clue = "Round 86: Cats’ hiding under…"; Answer = "bed" },
    @{ Clue = "Round 87: Cats’ favorite cardboard toy."; Answer = "tunnel" },
    @{ Clue = "Round 88: Cats’ favorite meat."; Answer = "chicken" },
    @{ Clue = "Round 89: Cats’ whiskers are sensitive to…"; Answer = "touch" },
    @{ Clue = "Round 90: Cats’ sleeping posture."; Answer = "curl" },
    @{ Clue = "Round 91: Cats’ internet-famous musical meme."; Answer = "keyboardcat" },
    @{ Clue = "Round 92: Cats’ favorite snack."; Answer = "cheese" },
    @{ Clue = "Round 93: Cats’ playful batting."; Answer = "paw" },
    @{ Clue = "Round 94: Cats’ high jump target."; Answer = "shelf" },
    @{ Clue = "Round 95: Cats’ grooming item."; Answer = "comb" },
    @{ Clue = "Round 96: Cats’ favorite sunspot."; Answer = "window" },
    @{ Clue = "Round 97: Cats’ stealth movement."; Answer = "sneak" },
    @{ Clue = "Round 98: Cats’ tail upright means."; Answer = "happy" },
    @{ Clue = "Round 99: Cats’ favorite box shape."; Answer = "square" },
    @{ Clue = "Round 100: Internet-famous grumpy cat meme."; Answer = "grumpycat" }
)

Clear-Host
Separator
Write-Host "🐱 WELCOME TO THE ULTIMATE CAT PASSWORD ADVENTURE 🐱" -ForegroundColor Magenta
Separator
Pause-Line 2
Show-Cat
Type-Text "In a digital world ruled by felines, only the true cat whisperer can solve the secrets..."
Pause-Line 2
Clear-Host
Write-Host "Greetings, ${player}! The cats have been expecting you." -ForegroundColor Green
Show-Cat
Pause-Line 2
Type-Text "To prove your worth, you must pass one hundred sacred cat trials..."
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
                    Write-Host "(Hint: Stay pawsitive!)" -ForegroundColor DarkCyan
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
        Write-Host "🐾 Send me an email with a screenshot of this message to get a bonus sticker on your name for the leaderboard" -ForegroundColor Magenta
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

# ===============================
# --- Start the Game ---
# ===============================
Play-Game -player $player
