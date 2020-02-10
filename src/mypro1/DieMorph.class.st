"
Pharo By Example
chapter 12.8 A complete example 

"
Class {
	#name : #DieMorph,
	#superclass : #BorderedMorph,
	#instVars : [
		'faces',
		'dieValue',
		'isStopped'
	],
	#category : #mypro1
}

{ #category : #accessing }
DieMorph class >> faces: aNumber [
^ self new faces: aNumber
]

{ #category : #drawing }
DieMorph >> drawDotOn: aCanvas at: aPoint [
	aCanvas
		fillOval:
			(Rectangle
				center: self position + (self extent * aPoint)
				extent: self extent / 6)
		color: Color black
]

{ #category : #drawing }
DieMorph >> drawOn: aCanvas [
	super drawOn: aCanvas.
	(self perform: ('face' , dieValue asString) asSymbol)
		do: [ :aPoint | self drawDotOn: aCanvas at: aPoint ]
]

{ #category : #'as yet unclassified' }
DieMorph >> face1 [
^ { (0.5 @ 0.5) }
]

{ #category : #'as yet unclassified' }
DieMorph >> face2 [
^ { 0.25@0.25 . 0.75@0.75 }
]

{ #category : #'as yet unclassified' }
DieMorph >> face3 [
^ { 0.25@0.25 . 0.75@0.75 . 0.5@0.5 }
]

{ #category : #'as yet unclassified' }
DieMorph >> face4 [
^ { 0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 }
]

{ #category : #'as yet unclassified' }
DieMorph >> face5 [
^ { 0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 . 0.5@0.5 }
]

{ #category : #'as yet unclassified' }
DieMorph >> face6 [
^ { 0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 . 0.25@0.5 . 0.75@0.5}
]

{ #category : #'as yet unclassified' }
DieMorph >> face7 [
^ { 0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 . 0.25@0.5 . 0.75@0.5 . 0.5@0.5 }
]

{ #category : #'as yet unclassified' }
DieMorph >> face8 [
^ { 0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 . 0.25@0.5 . 0.75@0.5 . 0.5@0.5 . 0.5@0.25 }
]

{ #category : #'as yet unclassified' }
DieMorph >> face9 [
^ { 0.25@0.25 . 0.75@0.25 . 0.75@0.75 . 0.25@0.75 . 0.25@0.5 . 0.75@0.5 . 0.5@0.5 . 0.5@0.25 . 0.5@0.75 }
]

{ #category : #accessing }
DieMorph >> faces: aNumber [
	"Set the number of faces"

	(aNumber isInteger and: [ aNumber > 0 and: [ aNumber <= 9 ]])
		ifTrue: [ faces := aNumber ]
]

{ #category : #initialization }
DieMorph >> initialize [
	super initialize.
	self extent: 50 @ 50.
	self
		useGradientFill;
		borderWidth: 2;
		useRoundedCorners.
	self setBorderStyle: #complexRaised.
	self fillStyle direction: self extent.
	self color: Color green.
	dieValue := 1.
	faces := 6.
	isStopped := false
]
