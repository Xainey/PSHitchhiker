###############################################################################
# Customize these properties and tasks
###############################################################################
param(
    $Artifacts = './artifacts',
    $ModuleName = 'PSHitchhiker',
    $ModulePath = './PSHitchhiker',
    $BuildNumber = $env:BUILD_NUMBER,
    $PercentCompliance  = '60'
)

###############################################################################
# Static settings -- no reason to include these in the param block
###############################################################################
$Settings = @{
    SMBRepoName = 'DSCGallery'
    SMBRepoPath = '\\Server01\Repo'

    Author =  "Michael Willis"
    Owners = "Michael Willis"
    LicenseUrl = 'https://github.com/Xainey/PSHitchhiker/LICENSE'
    ProjectUrl = "https://github.com/Xainey/PSHitchhiker"
    PackageDescription = "PSHitchhiker module pipeline demonstration"
    Repository = 'https://github.com/Xainey/PSHitchhiker.git'
    Tags = ""

    # TODO: fix any redudant naming
    GitRepo = "Xainey/PSHitchhiker"
    CIUrl = "http://jenkins/job/PSHitchhiker/"
}

###############################################################################
# Before/After Hooks for the Core Task: Clean
###############################################################################

# Synopsis: Executes before the Clean task.
task BeforeClean {}

# Synopsis: Executes after the Clean task.
task AfterClean {}

###############################################################################
# Before/After Hooks for the Core Task: Analyze
###############################################################################

# Synopsis: Executes before the Analyze task.
task BeforeAnalyze {}

# Synopsis: Executes after the Analyze task.
task AfterAnalyze {}

###############################################################################
# Before/After Hooks for the Core Task: Archive
###############################################################################

# Synopsis: Executes before the Archive task.
task BeforeArchive {}

# Synopsis: Executes after the Archive task.
task AfterArchive {}

###############################################################################
# Before/After Hooks for the Core Task: Publish
###############################################################################

# Synopsis: Executes before the Publish task.
task BeforePublish {}

# Synopsis: Executes after the Publish task.
task AfterPublish {}

###############################################################################
# Before/After Hooks for the Core Task: Test
###############################################################################

# Synopsis: Executes before the Test Task.
task BeforeTest {}

# Synopsis: Executes after the Test Task.
task AfterTest {}