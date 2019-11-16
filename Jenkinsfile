//
// Links:
// https://stackoverflow.com/questions/37468455/jenkins-pipeline-wipe-out-workspace
// https://stackoverflow.com/questions/40600621/continue-jenkins-pipeline-past-failed-stage
// 
// cron schedule: every 3 min M-M    */3 * * * *
//
// Define few things:
//
def $GITURL = 'https://rmilijasev@stash.us.cray.com/scm/ssmaut/cs_view_2.0_docker.git'
def $GITREPO = 'cs_view_2.0_docker'
// def $WORKSPACE = ...
//checkout scm :ToDo
pipeline {
    agent any
    //agent ph-jenkins-worker
    //agent docker
    
    options {
        disableConcurrentBuilds()
        // This build should not take long, fail the build if it appears stuck
        timeout(time: 3, unit: 'MINUTES')

        // Don't fill up the build server with unnecessary cruft
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }
    
    stages {
        
        stage('1-Cleaning dangling containers...')   {
            steps {
                echo 'Cleaning...'
                sh ("ls -al")
                //dir('docker-robot-framework') {
                //    deleteDir()
                //}
                //sh ('ls -al')
                sh ('docker images')  //maybe there are images we need to delete
                sh ('docker ps -a')   //maybe there are containers to delete
                //sh ("docker container prune -f")
                //sh ("docker system prune -f")
            }
        }
        
        stage('2-Pull the latest test repo into the WS...') {
            steps {
                //echo 'Is docker installed?'
                //sh ('docker --version')
                echo 'Clone the tests repo...'
                //sh ('git clone https://rmilijasev@stash.us.cray.com/scm/ssmaut/cs_view_2.0_docker.git')
                sh ("git clone https://github.com/95rade/docker-robot-framework")
                sh ("ls -al && pwd")
                dir("docker-robot-framework"){
                    sh ("pwd && ls -altr")
                } 
                
                echo 'Ready to build the image...'
            }
        }

        stage('3-Build Robot docker image')   {
            steps {
                echo 'Building robot docker image...'
                //sh ("chmod -R a+rw ${WORKSPACE}/cs_view_2.0_docker")
                dir("docker-robot-framework"){
                    sh ("chmod +x build")
                    sh ("ls -altr")
                    sh ("./build")
                    //sh ("docker pull sma-robot-image")
                }
                sh 'docker images | grep rade/'
                echo " We have the image..."
            }
        }
        
        stage('4-Run Tests in the container') {
            steps {
                echo 'Execute tests in the container...'
                dir("docker-robot-framework"){
                    sh ("pwd")
                    sh ("chmod +x run_tests.sh")
                    sh ("ls -altr")
                    sh ("./run_tests.sh")
                }
                echo "Tests executed..."
                //catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                //    sh "exit 1"
                //}
            }
        }
        
    
        
        //stage('Publish to TR') {
        //    steps {
        //        echo 'Publishing results to TestRail...'
        //        // Do Nothing
        //    }
        //}
    }
    post {
        always {
            //junit '. /*.xml'
            script {
                step(
                [
                $class                    : 'RobotPublisher',
                outputPath                : 'docker-robot-framework/reports/',
                outputFileName            : "*.xml",
                reportFileName            : "report.html",
                logFileName               : "log.html",
                disableArchiveOutput      : false,
                passThreshold             : 100,
                unstableThreshold         : 95.0,
                otherFiles                : "*.png"
                ]
                )
                }
            cleanWs()
            
        }
        failure {
        //    cleanWs()
            mail (to: 'someone@somewhere.com',
                subject: "Job '${env.JOB_NAME}' (${env.BUILD_NUMBER}) is waiting for input",
                body: "Please go to ${env.BUILD_URL}.");
            //input 'Ready to go?';
        }
        
    }
}
