"
A DeviceDirectorySizeTest is a test class for testing the behavior of DeviceDirectorySize
"
Class {
	#name : #DeviceDirectorySizeTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2022'
}

{ #category : #tests }
DeviceDirectorySizeTest >> testCompute [

	|aDevice  |
	aDevice := DeviceDirectorySize new.
	self assert: aDevice compute equals: 1206825.
]

{ #category : #tests }
DeviceDirectorySizeTest >> testComputeSample [

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
	self assert: aDevice compute equals: 95437.
]
