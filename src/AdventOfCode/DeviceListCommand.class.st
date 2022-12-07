"
AoC 2022 - Day 7 part 1 - device command to list directory contents
"
Class {
	#name : #DeviceListCommand,
	#superclass : #DeviceCommand,
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #'private - testing' }
DeviceListCommand class >> matchCommand: cmdString [

	^ cmdString = 'ls'
]

{ #category : #execution }
DeviceListCommand >> execute [
	
	[ self shouldProceed  ]
	whileTrue: [ 
		|termLineTokens firstToken|
		termLineTokens := self device nextTermLine substrings.
		firstToken := termLineTokens first.
		(self isAnotherCommand: firstToken) ifTrue: [ ^ true ].
		(self isFile: firstToken) ifTrue: [ self getOrCreateFile: termLineTokens].
		(self isDir: firstToken) ifTrue: [ self getOrCreateDir: termLineTokens].	
	].
	^ false

]

{ #category : #execution }
DeviceListCommand >> getOrCreateDir: lineTokens [

	|aDir|
	aDir := self device currentDirectory find: lineTokens last.
	aDir ifNil: [ aDir := self device currentDirectory makeDirectory: lineTokens last. 
	].
	^ aDir
	
]

{ #category : #execution }
DeviceListCommand >> getOrCreateFile: lineTokens [

	|aFile|
	aFile := self device currentDirectory find: lineTokens last.
	aFile ifNil: [ aFile := self device currentDirectory makeFile: lineTokens last. 
		aFile size: lineTokens first asNumber
	].
	^ aFile
	
]

{ #category : #execution }
DeviceListCommand >> isAnotherCommand: aToken [

	^ aToken = '$'
]

{ #category : #execution }
DeviceListCommand >> isDir: aToken [

	^ aToken = 'dir'
]

{ #category : #execution }
DeviceListCommand >> isFile: aToken [

	^ aToken isAllDigits 
]
