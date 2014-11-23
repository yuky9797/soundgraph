#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0, 0, 0);
    ofEnableAlphaBlending();//透過度初期設定
    soundone .loadSound("ray.mp3");
    soundone.setLoop(true);
    soundone.play();
    
    ofSetFrameRate(100);
    elapsed =0;
    //slide=0;
    int buffersize = 256;
    left.assign(buffersize, 0.0);
    soundstream.setup(this,0,2,44100,buffersize,4);
}

//--------------------------------------------------------------
void ofApp::update(){
    //volumeone = ofSoundGetSpectrum(getprecision);
    elapsed++;
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetColor(20, 100, 155);//波形の色を指定
    ofSetLineWidth(3);//線の幅を決定
    slide++;//波形をずらすため一追加
    if(slide ==130)slide=0;//130ずれたらリセット
    ofBeginShape();
    for(unsigned int i =0; i<left.size(); i++){
        ofVertex(i*10,500-left[i+slide]*3000.0f);
    };
    ofEndShape(false);//店集合の終了

}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}
//--------------------------------------------------------------

void ofApp::audioin(float *input, int buffersize, int channels){

    if(elapsed%8==0){
        for(int i=0; i<buffersize; i++){
            left[i]    =input[i*2]*0.5;}
    }
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}
