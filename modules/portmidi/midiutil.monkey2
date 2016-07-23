Const Higit:=New String[]("0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F")

Function Hex2:String(b:Int)
	Local b0:Int=(b Shr 4)&$f
	Local b1:int=(b & $f)
	Return Higit[b0]+Higit[b1]
end
