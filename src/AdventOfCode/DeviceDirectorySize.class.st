"
AoC 2022 - Day 7 part 1
"
Class {
	#name : 'DeviceDirectorySize',
	#superclass : 'AoC2022',
	#instVars : [
		'currentDirectory',
		'lineNumber',
		'termLines'
	],
	#category : 'AdventOfCode-AoC2022',
	#package : 'AdventOfCode',
	#tag : 'AoC2022'
}

{ #category : 'api actions' }
DeviceDirectorySize >> compute [ 
	
	[(DeviceCommand on: self) execute] whileTrue.
	^ self sizesUpTo100k
]

{ #category : 'accessing' }
DeviceDirectorySize >> currentDirectory [

	^ currentDirectory
]

{ #category : 'accessing' }
DeviceDirectorySize >> currentDirectory: anObject [

	currentDirectory := anObject
]

{ #category : 'initialization' }
DeviceDirectorySize >> initialize [ 

	super initialize.
	self currentDirectory: (DeviceDirectory named: '/').
	self lineNumber: 1.
]

{ #category : 'initialization' }
DeviceDirectorySize >> initializeTermLines [

	self termLines: (self input splitOn: (Character cr)).
	^ self termLines
]

{ #category : 'accessing' }
DeviceDirectorySize >> lineNumber [

	^ lineNumber
]

{ #category : 'accessing' }
DeviceDirectorySize >> lineNumber: anObject [

	lineNumber := anObject
]

{ #category : 'accessing' }
DeviceDirectorySize >> nextTermLine [

	lineNumber := lineNumber +1.
	"lineNumber > self termLines size ifTrue: [ self signalEOF ]."
	^ self termLines at: self lineNumber
	
]

{ #category : 'api actions' }
DeviceDirectorySize >> root [

	^ self currentDirectory findRoot
]

{ #category : 'api actions' }
DeviceDirectorySize >> sizesUpTo100k [
	|dirs|
	dirs := OrderedCollection withAll: self root allSubDirs.
	dirs addFirst: self root.
	^ (dirs select: [:aDir | aDir sizeOnDevice <= 100000 ] thenCollect: [:matchingDir | matchingDir sizeOnDevice  ]) sum
]

{ #category : 'accessing' }
DeviceDirectorySize >> termLine [

	^ self termLines at: self lineNumber
	
]

{ #category : 'accessing' }
DeviceDirectorySize >> termLines [

	^ termLines ifNil: [ self initializeTermLines ]
]

{ #category : 'accessing' }
DeviceDirectorySize >> termLines: anObject [

	termLines := anObject
]
