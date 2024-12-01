"
A DeviceListCommandTest is a test class for testing the behavior of DeviceListCommand
"
Class {
	#name : 'DeviceListCommandTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2022',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2022'
}

{ #category : 'tests' }
DeviceListCommandTest >> testExecute [

	|aDevice lines |
	lines := '$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d'.
	aDevice := DeviceDirectorySize new.
	aDevice lineNumber: 1.
	aDevice input: lines.
	aDevice compute.
	self assert: aDevice currentDirectory name equals: '/'.
	self assert: aDevice currentDirectory contents size equals: 4.
	


]
