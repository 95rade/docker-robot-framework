node {

    def build_ok = true

    stage('1-Clean the WS') {
        cleanWs()
    }
    
    stage('2-Clone the test repo') {
        //sh 'ecxit 0'
         sh ("git clone https://github.com/95rade/docker-robot-framework")
    }
    
    stage('3-Build the image') {
        dir("docker-robot-framework") {
            sh ("chmod +x build")
            //sh ("ls -altr")
            sh ("./build")
            sh ("docker images")
        }
    }
    
    try{
        stage('4-Run the tests') {
            //sh 'exit 1'  //, propagate: false  // failure
            dir("docker-robot-framework"){
                sh ("chmod +x run_tests.sh")
                sh ("ls -altr")
                sh ("./run_tests.sh")  //If stage failed we fail the stage but we pass the Pipeline.
                //sh ("docker pull sma-robot-image")
                
            }
            
        }
    }   catch(e) {
            build_ok = false   //Stage failed
            echo e.toString()  
        }
        //finally {
            
            //build_ok = false
            //echo e.toString() 
        //}
        
    // ... Other stages
    
    stage('5-Publishing Results') {
        //sh 'exit 0'
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
        sh ("exit 0")
    }
    
    if(build_ok) {
        currentBuild.result = "FAILURE"
    } else {
        currentBuild.result = "SUCCESS"
    }
    
}
