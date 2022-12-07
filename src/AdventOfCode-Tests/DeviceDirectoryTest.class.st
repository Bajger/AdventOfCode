"
A DeviceDirectoryTest is a test class for testing the behavior of DeviceDirectory
"
Class {
	#name : #DeviceDirectoryTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2022'
}

{ #category : #test }
DeviceDirectoryTest >> testAllSubDirs [

	|aDevice lines dirs|
	lines := '$ ls
dir a
10 b.txt
20 c.dat
dir d
$ cd a
$ ls
dir e
30 f
40 g'.
	aDevice := DeviceDirectorySize new.
	aDevice lineNumber: 1.
	aDevice input: lines.
	aDevice compute.
	dirs := aDevice root allSubDirs.
	self assert: (dirs collect: #name) asArray equals:{'a'. 'd'.'e'.}.
]

{ #category : #tests }
DeviceDirectoryTest >> testSizeOfRoot [

		|aDevice lines |
	lines := '$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k'.
	aDevice := DeviceDirectorySize new.
	aDevice input: lines.
	aDevice compute	.
	self assert: aDevice root sizeOnDevice equals: 48381165.
]

{ #category : #tests }
DeviceDirectoryTest >> testSizeOnDevice [

		|aDevice command lines |
	lines := '$ ls
dir a
10 b.txt
20 c.dat
dir d'.
	aDevice := DeviceDirectorySize new.
	aDevice lineNumber: 1.
	aDevice input: lines.
	command := DeviceCommand on: aDevice.
	command execute	.
	self assert: aDevice currentDirectory sizeOnDevice equals: 30.
]

{ #category : #tests }
DeviceDirectoryTest >> testSizeOnDeviceInHiearchy [

		|aDevice command lines |
	lines := '$ ls
dir a
10 b.txt
20 c.dat
dir d
$ cd a
$ ls
dir e
30 f
40 g'.
	aDevice := DeviceDirectorySize new.
	aDevice lineNumber: 1.
	aDevice input: lines.
	command := DeviceCommand on: aDevice.
	aDevice compute.
	self assert: aDevice root sizeOnDevice equals: 100.
]
