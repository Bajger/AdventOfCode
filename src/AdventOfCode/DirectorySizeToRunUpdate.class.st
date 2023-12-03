"
Aoc 2022 - day 7 part 2
"
Class {
	#name : 'DirectorySizeToRunUpdate',
	#superclass : 'DeviceDirectorySize',
	#category : 'AdventOfCode-AoC2022',
	#package : 'AdventOfCode',
	#tag : 'AoC2022'
}

{ #category : 'api actions' }
DirectorySizeToRunUpdate >> compute [
	
	super compute.
	^ (self root allSubDirs select: [:each | each sizeOnDevice >= self requiredFreeSpace ] thenCollect: #sizeOnDevice) min 
]

{ #category : 'api actions' }
DirectorySizeToRunUpdate >> requiredFreeSpace [
	|actualFreeSpace |
	actualFreeSpace := 70000000 - self root sizeOnDevice.
	^ 30000000 - actualFreeSpace 
]
