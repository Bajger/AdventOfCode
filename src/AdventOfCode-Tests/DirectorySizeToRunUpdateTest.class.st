"
A DirectorySizeToRunUpdateTest is a test class for testing the behavior of DirectorySizeToRunUpdate
"
Class {
	#name : 'DirectorySizeToRunUpdateTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2022',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2022'
}

{ #category : 'tests' }
DirectorySizeToRunUpdateTest >> testCompute [
	|aDevice|
	aDevice := DirectorySizeToRunUpdate new.

	self assert: aDevice compute equals: 9608311.
]

{ #category : 'tests' }
DirectorySizeToRunUpdateTest >> testComputeSample [

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
	aDevice := DirectorySizeToRunUpdate new.
	aDevice input: lines.
	self assert: aDevice compute equals: 24933642.
]

{ #category : 'tests' }
DirectorySizeToRunUpdateTest >> testRequiredFreeSpace [

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
	aDevice := DirectorySizeToRunUpdate new.
	aDevice input: lines.
	aDevice compute.
	self assert: aDevice requiredFreeSpace equals: 8381165.
]
