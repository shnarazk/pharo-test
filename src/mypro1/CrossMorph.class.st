"
Pharo By Example: Morph 
"
Class {
	#name : #CrossMorph,
	#superclass : #Morph,
	#category : #mypro1
}

{ #category : #drawing }
CrossMorph >> containsPoint:	aPoint [
	| crossHeight crossWidth horizontalBar verticalBar |
	crossHeight := self height / 3.0.
	crossWidth := self width / 3.0.
	horizontalBar := self bounds insetBy: 0 @ crossHeight .
	verticalBar := self bounds insetBy: crossWidth @ 0.
	^ (horizontalBar containsPoint: aPoint) or: [ verticalBar containsPoint: aPoint ]
]

{ #category : #drawing }
CrossMorph >> drawOn: aCanvas [
	| crossHeight crossWidth horizontalBar verticalBar |
	crossHeight := self height / 3.0.
	crossWidth := self width / 3.0.
	horizontalBar := self bounds insetBy: 0 @ crossHeight .
	verticalBar := self bounds insetBy: crossWidth @ 0.
	aCanvas fillRectangle: horizontalBar color: self color.
	aCanvas fillRectangle: verticalBar color: self color.
	
]
