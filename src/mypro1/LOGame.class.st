"
Light Off Game, Pharo by Example.
"
Class {
	#name : #LOGame,
	#superclass : #BorderedMorph,
	#instVars : [
		'cells'
	],
	#category : #mypro1
}

{ #category : #'accessing - data' }
LOGame >> cellsPerSide [
	"The number of cells along each side of the game"

	^ 16
]

{ #category : #initialization }
LOGame >> initialize [
	"comment stating purpose of instance-side message"

	"scope: class-variables  &  instance-variables"

	| sampleCell width height n |
	super initialize.
	n := self cellsPerSide.
	sampleCell := LOCell new.
	width := sampleCell width.
	height := sampleCell height.
	self
		bounds: (5 @ 5 extent: (width * n) @ (height * n) + (2 * self borderWidth)).
	cells := Array2D new: n tabulate: [ :i :j | self newCellAt: i at: j ].
	self openInWindow.
	owner setLabel: 'Light Off'
]

{ #category : #initialization }
LOGame >> newCellAt: i at: j [
	| c origin |
	c := LOCell new.
	origin := self innerBounds origin.
	self addMorph: c.
	c position: ((i - 1) * c width) @ ((j - 1) * c height) + origin.
	c mouseAction: [ self toggleNeighborsOfCellAt: i at: j ].
	^ c
]

{ #category : #'model updates' }
LOGame >> toggleNeighborsOfCellAt: i at: j [
	i > 1
		ifTrue: [ (cells at: i - 1 at: j) toggleState ].
	i < self cellsPerSide
		ifTrue: [ (cells at: i + 1 at: j) toggleState ].
	j > 1
		ifTrue: [ (cells at: i at: j - 1) toggleState ].
	j < self cellsPerSide
		ifTrue: [ (cells at: i at: j + 1) toggleState ]
]
