exports.GenAssembler = (array) ->
	
	aVocab = array

	@GenNumber = (nRange) ->
		iNumGen = undefined
		iNumGen = Math.round((Math.random() * nRange))
		iNumGen

	@GetFrom = (aArray) ->
		sReturn = aArray[@GenNumber(aArray.length)]
		sReturn = @GetFrom(aArray)  if sReturn is `undefined`
		sReturn

	@GetArray = (sArrayName) ->
		intLooper = 0

		while intLooper < aVocab.length
			return aVocab[intLooper][1]  if aVocab[intLooper][0] is sArrayName
			intLooper++

	@ScanLine = (sLine) ->
		iTagStart = 0
		iTagEnd = 0
		sKey = undefined
		if sLine.indexOf("<") > -1
			iTagStart = sLine.indexOf("<")
			iTagEnd = sLine.indexOf(">")
			sKey = sLine.substr(iTagStart + 1, iTagEnd - (iTagStart + 1))
			sKey = @GetFrom(@GetArray(sKey))
			sLine = sLine.substr(0, iTagStart) + sKey + sLine.substr(iTagEnd + 1, (sLine.length - iTagEnd))
		sLine = @ScanLine(sLine)  if sLine.indexOf("<") > -1
		sLine

	@Generate = ->
		sLine = @GetFrom(@GetArray("FIRST"))
		sLine = @ScanLine(sLine)
		sLine

	undefined