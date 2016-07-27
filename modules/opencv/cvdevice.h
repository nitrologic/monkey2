#pragma once

#include "opencv2/opencv.hpp"

// cvdevice.h

// public monkey2 module interface

class CVDevice{
public:
	static int Version;
	static int CaptureCount;

	bool isOpen;

	static CVDevice *OpenCapture(int id);

private:
	cv::VideoCapture captureDevice;
	CVDevice(int id);
};
