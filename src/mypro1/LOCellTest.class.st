Class {
	#name : #LOCellTest,
	#superclass : #TestCase,
	#category : #mypro1
}

{ #category : #tests }
LOCellTest >> testCreatingLOCell [
	| cell |
	cell := LOCell new.
	self assert: true
]
