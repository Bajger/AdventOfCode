"
A DeviceCommandTest is a test class for testing the behavior of DeviceCommand
"
Class {
	#name : 'DeviceCommandTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2022',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2022'
}

{ #category : 'test' }
DeviceCommandTest >> testShouldProceed [

	|aDevice command|
	aDevice := DeviceDirectorySize new.
	aDevice lineNumber: 1.
	aDevice termLines: (Array new: 5).
	command := DeviceCdCommand new.
	command device: aDevice.
	
	self assert: command shouldProceed.
	
	aDevice lineNumber: 5.
	self deny: command shouldProceed.
	aDevice lineNumber: 6.
	self deny: command shouldProceed.
]
