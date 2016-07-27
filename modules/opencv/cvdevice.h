#pragma once

#include "opencv2/opencv.hpp"

// cvdevice.h

// public monkey2 module interface

struct CVDevice{
	static int Version;
	static int CaptureCount;
	bool isOpen;
	cv::VideoCapture captureDevice;
	CVDevice();
};
