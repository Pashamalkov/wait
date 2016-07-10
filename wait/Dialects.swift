//
//  File.swift
//  Wait
//
//  Created by Паша on 09.07.16.
//  Copyright © 2016 Паша. All rights reserved.
//

import Foundation



let dialects = ["Anglo-Cornish","Bristol", "Brummie", "Cambridgeshire", "Cockney", "Cumbrian", "Devon", "East Midlands", "Geordie", "Highland Scottish", "Kent", "Lancashire", "Mancunian", "Manx English", "Norfolk", "Northumbrian", "Pitmatic", "Protteries", "Scots", "Scouse", "South East", "Suffolk", "Sussex", "Ulster English", "Ulster Scots", "Welsh English", "West Country", "West Midlands", "Yorkshire"]



let descriptions = [
    
    "Anglo-Cornish" : "Anglo-Cornish (also known as Cornish English, Cornu-English, or Cornish dialect) is a dialect of English spoken in Cornwall by Cornish people. Dialectal English spoken in Cornwall is to some extent influenced by Cornish grammar, and often includes words derived from the Cornish language. The Cornish language is a Celtic language of the Brythonic branch, as are the Welsh and Breton languages. In addition to the distinctive words and grammar, there are a variety of accents found within Cornwall from the north coast to that of the south coast and from east to west Cornwall. The speech of the various parishes being to some extent different from the others was described by John T. Tregellas and Thomas Q. Couch towards the end of the 19th century. Tregellas wrote of the differences as he understood them and Couch suggested the parliamentary constituency boundary from Crantock to Veryan as roughly the border between east and west." ,
    
    "Bristol" : "A dialect of English, known as Bristolian, Bristolese, Brizzle or Bristle (after the publication of Derek Robson's \"Krek Waiters peak Bristle\") is spoken by longtime residents, who are known as Bristolians.[254] Bristol natives have a rhotic accent, in which the post-vocalic r in \"car\" and \"card\" is pronounced (unlike in Received Pronunciation). The unique feature of this accent is the \"Bristol (or terminal) l\", in which l is appended to words ending in a or o.[255] Whether this is a broad l or a w is a subject of debate,[256] with \"area\" pronounced \"areal\" or \"areaw\". The ending of \"Bristol\" is another example of the Bristol l. Bristolians pronounce -a and -o at the end of a word as -aw (cinemaw). To non-natives, the pronunciation suggests an l after the vowel.",
    
    "Brummie" : "Brummie (sometimes Brummy) is the accent and dialect of Birmingham, England. The term derives from Brummagem or Bromwichham, historical variants of the name Birmingham. It is also a demonym for people from Birmingham.\nIt is not the only accent of the West Midlands although the term Brummie is often erroneously used in referring to all accents of the region.[citation needed] It is markedly distinct from the traditional accent of the adjacent Black Country although modern-day population mobility has tended to blur the distinction. For instance, Dudley-born comedian Lenny Henry, Walsall-born rock musician Noddy Holder, Smethwick-born actress Julie Walters, Wollaston-born soap actress Jan Pearson, West Bromwich-born comedian Frank Skinner, are sometimes mistaken for Brummie-speakers by people outside the West Midlands county.",
    
    "Cambridgeshire" : "Cambridgeshire (/ˈkeɪmbrɪdʒʃər/ or /ˈkeɪmbrɪdʒʃɪər/; abbreviated Cambs.), formerly known as the County of Cambridge,[1] is an East Anglian county in England, bordering Lincolnshire to the north, Norfolk to the north-east, Suffolk to the east, Essex and Hertfordshire to the south, and Bedfordshire and Northamptonshire to the west. The city of Cambridge is the county town. Modern Cambridgeshire was formed in 1974 as an amalgamation of the counties of Cambridgeshire and Isle of Ely and Huntingdon and Peterborough, which had been created in 1965 from the historic counties of Cambridgeshire, Huntingdonshire, the Isle of Ely and the Soke of Peterborough. It contains most of the region known as Silicon Fen.",
    
    "Cockney" : "Cockney English refers to the accent or dialect of English traditionally spoken by working-class Londoners. In recent years, many aspects of cockney English have become part of general South East English speech, producing a variant known as estuary English.",
    
    "Cumbrian" : "The Cumbrian dialect is a local Northern English dialect spoken in Cumbria and surrounding northern England, not to be confused with the extinct Celtic language Cumbric that used to be spoken in Cumbria. As in any county, there is a gradual drift in accent towards its neighbours. Barrow-in-Furness (within the historic boundaries of Lancashire) has a similar accent to much of Lancashire whilst the northern parts of Cumbria have a more North-East English sound to them. Whilst clearly being an English accent approximately between Lancashire and the North-East, it shares much vocabulary with Scots.",
    
    "Devon" : "Devon (archaically known as Devonshire) is a county of England, reaching from the Bristol Channel in the north to the English Channel in the south. It is part of South West England, bounded by Cornwall to the west, Somerset to the northeast, and Dorset to the east. The City of Exeter is the county town; seven other districts of East Devon, Mid Devon, North Devon, South Hams, Teignbridge, Torridge, and West Devon are under the jurisdiction of Devon County Council; Plymouth and Torbay are each a part of Devon but administered as unitary authorities. Combined as a ceremonial county, Devon's area is 6,707 km2 (2,590 square miles)[3] and its population is about 1.1 million.",
    
    "East Midlands" : "The East Midlands is one of nine official regions of England at the first level of NUTS for statistical purposes. The eastern part of the Midlands, the region consists of Derbyshire, Leicestershire, Lincolnshire (excl. south Humber), Northamptonshire, Nottinghamshire and Rutland.",
    
    "Geordie" : "The Geordie dialect and self-identification as a Geordie are primarily associated with those of a working-class background. In a 2008 newspaper survey, the Geordie accent was found to be the \"most attractive in England\"." ,
    
    "Highland Scottish" : " The Highlands (Scottish Gaelic: A' Ghàidhealtachd, \"the place of the Gaels\"; Scots: the Hielands) are a historic region of Scotland. The region became culturally distinguishable from the Lowlands from the later Middle Ages into the modern period, when Lowland Scots replaced Scottish Gaelic throughout most of the Lowlands. The term is also used for the area north and west of the Highland Boundary Fault, although the exact boundaries are not clearly defined, particularly to the east. The Great Glen divides the Grampian Mountains to the southeast from the Northwest Highlands. The Scottish Gaelic name of A' Ghàidhealtachd literally means \"the place of the Gaels\" and traditionally, from a Gaelic-speaking point of view, includes both the Western Isles and the Highlands.",
    
    "Kent" : "",
    
    "Lancashire" : "",
    
    "Mancunian" : "",
    
    "Manx English" : "",
    
    "Norfolk" : "",
    
    "Northumbrian" : "",
    
    "Pitmatic" : "",
    
    "Protteries" : "",
    
    "Scots" : "",
    
    "Scouse" : "",
    
    "South East" : "",
    
    "Suffolk" : "",
    
    "Sussex" : "",
    
    "Ulster English" : "",
    
    "Ulster Scots" : "",
    
    "Welsh English" : "",
    
    "West Country" : "West Country English refers collectively to the English language varieties and accents used by much of the native population of South West England, the area popularly known as the West Country.\nThe West Country is often defined as encompassing the counties of Cornwall, Devon, Dorset, Somerset and Wiltshire, and the City of Bristol; Gloucestershire and even Herefordshire and Worcestershire are sometimes also included. However, the northern and eastern boundaries of the area are hard to define. In adjacent counties of Berkshire, Hampshire, the Isle of Wight and Oxfordshire it is possible to encounter similar accents and, indeed, much the same distinct dialect, though with some similarities to others in neighbouring regions — a dialect speaker from the Isle of Wight for instance could hold an understandable conversation with a dialect speaker from Devon without too many problems. Although natives of such locations, especially in rural parts, can still have West Country influences in their speech, the increased mobility and urbanisation of the population have meant that in Berkshire, Hampshire (including the Isle of Wight), and Oxfordshire the dialect itself – as opposed to various local accents – is becoming increasingly rare.\nAcademically the regional variations are considered to be dialectal forms. The Survey of English Dialects captured manners of speech across the South West region that were just as different from Standard English as anything from the far North of England. There is some influence from the Welsh and Cornish languages, depending on the specific location.",
    
    "West Midlands" : "",
    
    "Yorkshire" : ""

]