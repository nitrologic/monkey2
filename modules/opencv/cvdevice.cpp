#include "cvdevice.h"

int CVDevice::Version=17;
int CVDevice::CaptureCount=0;

CVDevice::CVDevice(int id):captureDevice(id){
	isOpen=captureDevice.isOpened();
	if (isOpen){
		CaptureCount++;
	}
	if(isOpen){
		printf("capture device open\n");
	}else{
		printf("no default capture device\n");
	}
}

CVDevice *CVDevice::OpenCapture(int id){
	return new CVDevice(id);
}
