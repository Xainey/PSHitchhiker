// Config
class Globals {
   static String GitRepo = 'https://github.com/Xainey/PSHitchhiker.git'
   static String ModuleName = 'PSHitchhiker'
   static String JenkinsChannel = '#jenkins-channel'
}

// Workflow Steps
node('master') {
  try {
    notifyBuild('STARTED')

    stage('Stage 0: Clone') {
      git url: Globals.GitRepo
    }
    stage('Stage 1: Clean') {
      posh 'Invoke-Build Clean'
    }
    stage('Stage 2: Analyze') {
      posh 'Invoke-Build Analyze'
    }
    stage('Stage 3: Test') {
      posh 'Invoke-Build RunTests'
      step([$class: 'NUnitPublisher',
        testResultsPattern: '**\\TestResults.xml',
        debug: false,
        keepJUnitReports: true,
        skipJUnitArchiver:false,
        failIfNoResults: true
      ])
      publishHTML (target: [
        allowMissing: false,
        alwaysLinkToLastBuild: true,
        keepAll: true,
        reportDir: 'artifacts',
        reportFiles: 'TestReport.htm',
        reportName: "PowerShell Test Report"
      ])
      posh 'Invoke-Build ConfirmTestsPassed'
    }
    stage('Stage 4: Archive') {
      posh 'Invoke-Build Archive'
      archiveArtifacts artifacts: "artifacts/${Globals.ModuleName}.zip", onlyIfSuccessful: true
      archiveArtifacts artifacts: "artifacts/${Globals.ModuleName}.*.nupkg", onlyIfSuccessful: true
    }
    stage('Stage 5: Publish') {
      timeout(20) {
        posh 'Invoke-Build Publish'
      }
    }

  } catch (e) {
    currentBuild.result = "FAILED"
    throw e
  } finally {
    notifyBuild(currentBuild.result)
  }
}

// Helper function to run PowerShell Commands
def posh(cmd) {
  bat 'powershell.exe -NonInteractive -NoProfile -ExecutionPolicy Bypass -Command "& ' + cmd + '"'
}

// Helper function to Broadcast Build to Slack
def notifyBuild(String buildStatus = 'STARTED') {

  buildStatus = buildStatus ?: 'SUCCESSFUL'

  def colorCode = '#FF0000' // Failed : Red
  if (buildStatus == 'STARTED') { colorCode = '#FFFF00' } // STARTED: Yellow
  else if (buildStatus == 'SUCCESSFUL') { colorCode = '#00FF00' } // SUCCESSFUL: Green

  def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  def summary = "${subject} (${env.BUILD_URL})"

  slackSend (color: colorCode, channel: "${Globals.JenkinsChannel}", message: summary)
}