List alphabet=["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];

 String formatText(String Text){/*
  for(int i=0; i<Text.length; i++){
    if(Text[i]=='\''||Text[i]==' '||Text[i]==','||Text[i]=='\"'||
        Text[i]=='/'||Text[i]=='\\'||Text[i]==';'||Text[i]=='.'||
        Text[i]==':'||Text[i]=='-'||Text[i]=='_'||
        Text[i]=='0'||Text[i]=='1'||Text[i]=='2'||Text[i]=='3'||
        Text[i]=='4'||Text[i]=='5'||Text[i]=='6'||Text[i]=='7'||Text[i]=='8'||Text[i]=='9') {
       Text[i].replaceAll(Text[i], '');
       print("fin remplacement ");
    }
  }*/
  Text.replaceAll(' ', '');
  return Text.replaceAll(' ', '');
}

List VerifierMatrice(num a,num b,num c, num d){
  List premier = [1, 3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25];

  if((a*d)-(b*c)==0)
    return [false,0];
  else{
    int k = ((a*d)-(b*c)) as int;
    int value=0;
    for(int i=1; i<premier.length; i++)
    {
      if(( (premier[i]*k)%26  ) ==1){
        value = premier[i];
      }
      if(value!=0 && i==(premier.length-1)){
        return [true, value];
      }
    }
  }

  return [false,0];
}

String ChiffrerMessage(String Text,num a,num b,num c, num d){
  List result =[];
  int i=0;

  while(i<Text.length){
    print(alphabet.indexOf(Text[i]));
    int position1 = alphabet.indexOf(Text[i]);
    int position2;
    if((i+1)==Text.length)
      position2 = alphabet.indexOf("z");
    else
      position2 = alphabet.indexOf(Text[i+1]);

    int P1= (a*position1+b*position2)%26 as int;
    int P2 = (c*position1+d*position2)%26 as int;
    String C1 = alphabet[P1];
    String C2 = alphabet[P2];
    result.add(C1);
    result.add(C2);
    i=i+2;
  }
  return result.join('');
  //return "haha";
}

String DeChiffrerMessage(String Text,num a,num b,num c, num d,num k){
  List result =[];
  for(int i=0; i<26;i++){
    print(" position: ${i} , valeur: ${alphabet[i]}");
  }
  print(" k : ${k}");
  int b1=(-b*k)%26 as int;
  int c1=(-c*k)%26 as int;
  int a1= (d*k)%26 as int;
  int d1= (a*k)%26 as int;
  int i=0;
  print(" a1: ${a1}, b1: ${b1}, c1: ${c1}, d1: ${d1}");
  while(i<Text.length){
    int position1 = alphabet.indexOf(Text[i]);
    int position2 = alphabet.indexOf(Text[i+1]);
    print(" position1 : ${position1} , position2 : ${position2}");
    int P1 = (a1*position1+b1*position2) % 26;
    int P2 = (c1*position1+d1*position2) % 26;
    String C1 = alphabet[P1];
    String C2 = alphabet[P2];
    result.add(C1);
    result.add(C2);

    i=i+2;
  }
  return result.join('');
}
