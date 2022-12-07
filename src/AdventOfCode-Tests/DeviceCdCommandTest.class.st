"
A DeviceCdCommandTest is a test class for testing the behavior of DeviceCdCommand
"
Class {
	#name : #DeviceCdCommandTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2022'
}

{ #category : #tests }
DeviceCdCommandTest >> testExecute [

	|aDevice command aDir|
	aDevice := DeviceDirectorySize new.
	aDevice lineNumber: 1.
	aDevice termLines: (Array with: '$ cd ..').
	aDir := (DeviceDirectory named: 'A') makeDirectory: 'B'.
	aDevice currentDirectory: aDir.
	command := DeviceCommand on: aDevice.
	command execute	.
	self assert: aDevice currentDirectory name equals: 'A'.
	
	aDevice lineNumber: 1.
	aDevice termLines: (Array with: '$ cd B').
	command execute	.
	self assert: aDevice currentDirectory name equals: 'B'.

	aDevice lineNumber: 1.
	aDevice termLines: (Array with: '$ cd C').
	self should: [command execute] raise: Error.


]
