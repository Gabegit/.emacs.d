FasdUAS 1.101.10   ��   ��    k             l      ��  ��    $  version 2.1.1 - Jun 17, 2011      � 	 	 <   v e r s i o n   2 . 1 . 1   -   J u n   1 7 ,   2 0 1 1     
  
 l      ��  ��    , & sends contents of clipboard to Stata      �   L   s e n d s   c o n t e n t s   o f   c l i p b o a r d   t o   S t a t a        l      ��  ��    U O allows running from command window, as a temporary do-file or via a menu item      �   �   a l l o w s   r u n n i n g   f r o m   c o m m a n d   w i n d o w ,   a s   a   t e m p o r a r y   d o - f i l e   o r   v i a   a   m e n u   i t e m        l      ��  ��    N H applescript bug: single bar in front of "include" causes compile error      �   �   a p p l e s c r i p t   b u g :   s i n g l e   b a r   i n   f r o n t   o f   " i n c l u d e "   c a u s e s   c o m p i l e   e r r o r        l      ��  ��    W Q args are: { "command" | "menu" | "dofile" || "include" } [ name-of-tmp-dofile ]      �   �   a r g s   a r e :   {   " c o m m a n d "   |   " m e n u "   |   " d o f i l e "   | |   " i n c l u d e "   }   [   n a m e - o f - t m p - d o f i l e   ]        i        !   I     �� "��
�� .aevtoappnull  �   � **** " o      ���� 0 args  ��   ! k    k # #  $ % $ l     �� & '��   &  - initializations    ' � ( ( " -   i n i t i a l i z a t i o n s %  ) * ) q       + + �� ,�� 0 numargs numArgs , �� -�� 0 pasteme pasteMe - �� .�� 0 dothis doThis . ������ 0 	tmpdofile 	tmpDoFile��   *  / 0 / q       1 1 �� 2�� 0 howmanystatas howManyStatas 2 �� 3�� 0 	thestatas 	theStatas 3 ������ 0 thestataname theStataName��   0  4 5 4 q       6 6 ������ $0 defaulttmpdofile defaultTmpDoFile��   5  7 8 7 r      9 : 9 m      ; ; � < <  f e e d S t a t a . d o : o      ���� $0 defaulttmpdofile defaultTmpDoFile 8  = > = q     ? ? ������ 0 uiok UIOK��   >  @ A @ l   �� B C��   B . ( first check that UI scripting will work    C � D D P   f i r s t   c h e c k   t h a t   U I   s c r i p t i n g   w i l l   w o r k A  E F E O     G H G Z     I J�� K I 1    ��
�� 
uien J r     L M L m    ��
�� boovtrue M o      ���� 0 uiok UIOK��   K r     N O N m    ��
�� boovfals O o      ���� 0 uiok UIOK H m     P P�                                                                                  sevs  alis    �  	Tucholsky                  �:��H+   OhSystem Events.app                                               P��7��        ����  	                CoreServices    �:�      �8'7     Oh Og� Og�  7Tucholsky:System:Library:CoreServices:System Events.app   $  S y s t e m   E v e n t s . a p p   	 T u c h o l s k y  -System/Library/CoreServices/System Events.app   / ��   F  Q�� Q l  k R S T R Z   k U V�� W U H     X X o    ���� 0 uiok UIOK V O    < Y Z Y k   # ; [ [  \ ] \ I  # ,�� ^ _
�� .sysodlogaskr        TEXT ^ m   # $ ` ` � a a � W h e n   S y s t e m   P r e f r e n c e s   o p e n s ,   b e   s u r e   t h a t   ' E n a b l e   a c c e s s   f o r   a s s i s t i v e   d e v i c e s '   i s   c h e c k e d ,   t h e n   t r y   a g a i n . _ �� b��
�� 
btns b J   % ( c c  d�� d m   % & e e � f f  O K��  ��   ]  g h g I  - 2������
�� .miscactvnull��� ��� null��  ��   h  i�� i r   3 ; j k j 4   3 7�� l
�� 
xppb l m   5 6 m m � n n H c o m . a p p l e . p r e f e r e n c e . u n i v e r s a l a c c e s s k 1   7 :��
�� 
xpcp��   Z m      o o�                                                                                  sprf  alis    t  	Tucholsky                  �:��H+   Oh%System Preferences.app                                          P���k/�        ����  	                Applications    �:�      �kh     Oh%  -Tucholsky:Applications:System Preferences.app   .  S y s t e m   P r e f e r e n c e s . a p p   	 T u c h o l s k y  #Applications/System Preferences.app   / ��  ��   W k   ?k p p  q r q l  ? ?�� s t��   s ' ! check proper number of arguments    t � u u B   c h e c k   p r o p e r   n u m b e r   o f   a r g u m e n t s r  v w v r   ? D x y x l  ? B z���� z n   ? B { | { 1   @ B��
�� 
leng | o   ? @���� 0 args  ��  ��   y o      ���� 0 numargs numArgs w  } ~ } Q   E �  � �  k   H � � �  � � � r   H N � � � n   H L � � � 4   I L�� �
�� 
cobj � m   J K����  � o   H I���� 0 args   � o      ���� 0 dothis doThis �  � � � Z   O j � ����� � H   O ^ � � E   O ] � � � J   O [ � �  � � � m   O P � � � � �  c o m m a n d �  � � � m   P Q � � � � �  m e n u �  � � � m   Q T � � � � �  d o f i l e �  ��� � m   T W � � � � �  i n c l u d e��   � o   [ \���� 0 dothis doThis � n  a f � � � I   b f�������� 0 badfirstarg badFirstArg��  ��   �  f   a b��  ��   �  ��� � Z   k � � ��� � � ?   k n � � � o   k l���� 0 numargs numArgs � m   l m����  � k   q � � �  � � � r   q w � � � n   q u � � � 4   r u�� �
�� 
cobj � m   s t����  � o   q r���� 0 args   � o      ���� 0 	tmpdofile 	tmpDoFile �  ��� � Z   x � � ����� � =   x } � � � o   x y���� 0 	tmpdofile 	tmpDoFile � m   y | � � � � �   � r   � � � � � o   � ����� $0 defaulttmpdofile defaultTmpDoFile � o      ���� 0 	tmpdofile 	tmpDoFile��  ��  ��  ��   � r   � � � � � o   � ����� $0 defaulttmpdofile defaultTmpDoFile � o      ���� 0 	tmpdofile 	tmpDoFile��   � R      ������
�� .ascrerr ****      � ****��  ��   � l  � � � � � � n  � � � � � I   � ��������� 0 badfirstarg badFirstArg��  ��   �  f   � � �   no arguments    � � � �    n o   a r g u m e n t s ~  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � U O grab clipboard, strip totally blank lines, to check if there is anything to do    � � � � �   g r a b   c l i p b o a r d ,   s t r i p   t o t a l l y   b l a n k   l i n e s ,   t o   c h e c k   i f   t h e r e   i s   a n y t h i n g   t o   d o �  � � � l  � ��� � ���   � 9 3   Aside: perhaps this should be on the emacs side?    � � � � f       A s i d e :   p e r h a p s   t h i s   s h o u l d   b e   o n   t h e   e m a c s   s i d e ? �  � � � l  � ��� � ���   � X R   for now it will stay here... could be wrong behavior, plus it is simpler to do     � � � � �       f o r   n o w   i t   w i l l   s t a y   h e r e . . .   c o u l d   b e   w r o n g   b e h a v i o r ,   p l u s   i t   i s   s i m p l e r   t o   d o   �  � � � l  � ��� � ���   �       in Applescript (!)    � � � � .           i n   A p p l e s c r i p t   ( ! ) �  � � � r   � � � � � n  � � � � � I   � ��� ����� "0 stripblanklines stripBlankLines �  ��� � I  � �������
�� .JonsgClp****    ��� null��  ��  ��  ��   �  f   � � � o      ���� 0 pasteme pasteMe �  � � � Z   � � � ����� � =   � � � � � o   � ����� 0 pasteme pasteMe � m   � � � � � � �   � O   � � � � � I  � ��� � �
�� .sysodlogaskr        TEXT � m   � � � � � � � , N o t h i n g   t o   s e n d   S t a t a ! � �� ���
�� 
btns � J   � � � �  ��� � m   � � � � � � �  C a n c e l��  ��   � m   � � � ��                                                                                  MACS  alis    h  	Tucholsky                  �:��H+   Oh
Finder.app                                                      O�Ƙ�        ����  	                CoreServices    �:�      ƘK�     Oh Og� Og�  0Tucholsky:System:Library:CoreServices:Finder.app   
 F i n d e r . a p p   	 T u c h o l s k y  &System/Library/CoreServices/Finder.app  / ��  ��  ��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � \ V in the best of worlds, it would be possible to allow looping through the instances of    � � � � �   i n   t h e   b e s t   o f   w o r l d s ,   i t   w o u l d   b e   p o s s i b l e   t o   a l l o w   l o o p i n g   t h r o u g h   t h e   i n s t a n c e s   o f �  � � � l  � ��� � ���   � 5 /   Stata to send the same code to each instance    � � � � ^       S t a t a   t o   s e n d   t h e   s a m e   c o d e   t o   e a c h   i n s t a n c e �    O   � � r   � � l  � ����� 6  � � 2   � ���
�� 
prcs E   � �	
	 1   � ���
�� 
pnam
 m   � � � 
 S t a t a��  ��   o      ���� 0 	thestatas 	theStatas m   � ��                                                                                  sevs  alis    �  	Tucholsky                  �:��H+   OhSystem Events.app                                               P��7��        ����  	                CoreServices    �:�      �8'7     Oh Og� Og�  7Tucholsky:System:Library:CoreServices:System Events.app   $  S y s t e m   E v e n t s . a p p   	 T u c h o l s k y  -System/Library/CoreServices/System Events.app   / ��    l  � ���������  ��  ��    r   � � l  � ����� I  � �����
�� .corecnte****       **** o   � ����� 0 	thestatas 	theStatas��  ��  ��   o      ���� 0 howmanystatas howManyStatas  Z   �@�� =  � � o   � ����� 0 howmanystatas howManyStatas m   � �����   O   � k   �  !  I  � ������
�� .sysobeepnull��� ��� long��  �  ! "�~" I  ��}#$
�} .sysodlogaskr        TEXT# m   �%% �&& " N o   S t a t a   r u n n i n g !$ �|'�{
�| 
btns' J  (( )�z) m  ** �++  C a n c e l�z  �{  �~   m   � �,,�                                                                                  MACS  alis    h  	Tucholsky                  �:��H+   Oh
Finder.app                                                      O�Ƙ�        ����  	                CoreServices    �:�      ƘK�     Oh Og� Og�  0Tucholsky:System:Library:CoreServices:Finder.app   
 F i n d e r . a p p   	 T u c h o l s k y  &System/Library/CoreServices/Finder.app  / ��  ��   k  @-- ./. Z  001�y�x0 ?  232 o  �w�w 0 howmanystatas howManyStatas3 m  �v�v 1 k  ,44 565 O  *787 I )�u9:
�u .sysodlogaskr        TEXT9 m  ;; �<< @ n o t h i n g   f o r   m u l t i p l e   s t a t a ' s   y e t: �t=�s
�t 
btns= J   %>> ?�r? m   #@@ �AA  C a n c e l�r  �s  8 m  BB�                                                                                  MACS  alis    h  	Tucholsky                  �:��H+   Oh
Finder.app                                                      O�Ƙ�        ����  	                CoreServices    �:�      ƘK�     Oh Og� Og�  0Tucholsky:System:Library:CoreServices:Finder.app   
 F i n d e r . a p p   	 T u c h o l s k y  &System/Library/CoreServices/Finder.app  / ��  6 CDC l ++�qEF�q  E : 4 Stata can use the same name for different processes   F �GG h   S t a t a   c a n   u s e   t h e   s a m e   n a m e   f o r   d i f f e r e n t   p r o c e s s e sD HIH l ++�pJK�p  J J D so... the it is impossible to cycle through Stata processes by name   K �LL �   s o . . .   t h e   i t   i s   i m p o s s i b l e   t o   c y c l e   t h r o u g h   S t a t a   p r o c e s s e s   b y   n a m eI M�oM l  ++�nNO�n  N � � tell application "System Events"					set theStatas to (the file of every process whose name contains "Stata")				 end tell				repeat with aStata in theStatas				end repeat
				   O �PPj   t e l l   a p p l i c a t i o n   " S y s t e m   E v e n t s "  	 	 	 	 	 s e t   t h e S t a t a s   t o   ( t h e   f i l e   o f   e v e r y   p r o c e s s   w h o s e   n a m e   c o n t a i n s   " S t a t a " )  	 	 	 	   e n d   t e l l  	 	 	 	 r e p e a t   w i t h   a S t a t a   i n   t h e S t a t a s  	 	 	 	 e n d   r e p e a t 
 	 	 	 	�o  �y  �x  / QRQ l 11�mST�m  S : 4 know there is exactly one instance of Stata running   T �UU h   k n o w   t h e r e   i s   e x a c t l y   o n e   i n s t a n c e   o f   S t a t a   r u n n i n gR VWV l 11�lXY�l  X   can finally get to work   Y �ZZ 0   c a n   f i n a l l y   g e t   t o   w o r kW [�k[ O  1@\]\ r  5?^_^ l 5=`�j�i` l 5=a�h�ga n  5=bcb 1  9=�f
�f 
pnamc l 59d�e�dd n  59efe 4 69�cg
�c 
cobjg m  78�b�b f o  56�a�a 0 	thestatas 	theStatas�e  �d  �h  �g  �j  �i  _ o      �`�` 0 thestataname theStataName] m  12hh�                                                                                  sevs  alis    �  	Tucholsky                  �:��H+   OhSystem Events.app                                               P��7��        ����  	                CoreServices    �:�      �8'7     Oh Og� Og�  7Tucholsky:System:Library:CoreServices:System Events.app   $  S y s t e m   E v e n t s . a p p   	 T u c h o l s k y  -System/Library/CoreServices/System Events.app   / ��  �k   iji l AA�_�^�]�_  �^  �]  j klk l AA�\mn�\  m $  Stata *must* be made active		   n �oo <   S t a t a   * m u s t *   b e   m a d e   a c t i v e 	 	l pqp O  APrsr I JO�[�Z�Y
�[ .miscactvnull��� ��� null�Z  �Y  s 4  AG�Xt
�X 
cappt o  EF�W�W 0 thestataname theStataNameq uvu l QQ�V�U�T�V  �U  �T  v w�Sw Z  Qkxy�Rzx = QV{|{ o  QR�Q�Q 0 dothis doThis| m  RU}} �~~  c o m m a n dy n Y`� I  Z`�P��O�P 0 pastetmpstata pasteTmpStata� ��� o  Z[�N�N 0 thestataname theStataName� ��M� o  [\�L�L 0 pasteme pasteMe�M  �O  �  f  YZ�R  z n ck��� I  dk�K��J�K 0 dotmpdofile doTmpDofile� ��� o  de�I�I 0 thestataname theStataName� ��� o  ef�H�H 0 	tmpdofile 	tmpDoFile� ��G� o  fg�F�F 0 dothis doThis�G  �J  �  f  cd�S   S ' !- from test of UI being turned on    T ��� B -   f r o m   t e s t   o f   U I   b e i n g   t u r n e d   o n��    ��� l     �E�D�C�E  �D  �C  � ��� i    ��� I      �B�A�@�B 0 badfirstarg badFirstArg�A  �@  � O     ��� I   �?��
�? .sysodlogaskr        TEXT� m    �� ��� \ T h e   f i r s t   a r g u m e n t   m u s t   b e   " c o m m a n d "   o r   " m e n u "� �>��=
�> 
btns� J    	�� ��<� m    �� ���  C a n c e l�<  �=  � m     ���                                                                                  MACS  alis    h  	Tucholsky                  �:��H+   Oh
Finder.app                                                      O�Ƙ�        ����  	                CoreServices    �:�      ƘK�     Oh Og� Og�  0Tucholsky:System:Library:CoreServices:Finder.app   
 F i n d e r . a p p   	 T u c h o l s k y  &System/Library/CoreServices/Finder.app  / ��  � ��� l     �;�:�9�;  �:  �9  � ��� i    ��� I      �8��7�8 0 dotmpdofile doTmpDofile� ��� o      �6�6 0 	stataname 	stataName� ��� o      �5�5 0 	tmpdofile 	tmpDoFile� ��4� o      �3�3 0 dowhat doWhat�4  �7  � k     �� ��� l     �2���2  � K E if multiple instances ever work, be sure this gets written just once   � ��� �   i f   m u l t i p l e   i n s t a n c e s   e v e r   w o r k ,   b e   s u r e   t h i s   g e t s   w r i t t e n   j u s t   o n c e� ��� q      �� �1��1 
0 tmpdir  � �0�/�0 "0 stupidapplefile stupidAppleFile�/  � ��� l     �.���.  � X R need to change this, because it changes the working directory in Stata on the Mac   � ��� �   n e e d   t o   c h a n g e   t h i s ,   b e c a u s e   i t   c h a n g e s   t h e   w o r k i n g   d i r e c t o r y   i n   S t a t a   o n   t h e   M a c� ��� r     ��� I    �-��,
�- .sysoexecTEXT���     TEXT� m     �� ��� 8 g e t c o n f   D A R W I N _ U S E R _ T E M P _ D I R�,  � o      �+�+ 
0 tmpdir  � ��� r    ��� l   ��*�)� b    ��� o    	�(�( 
0 tmpdir  � o   	 
�'�' 0 	tmpdofile 	tmpDoFile�*  �)  � o      �&�& 0 	tmpdofile 	tmpDoFile� ��� l   �%���%  � < 6 need applescript-style file name to write to the file   � ��� l   n e e d   a p p l e s c r i p t - s t y l e   f i l e   n a m e   t o   w r i t e   t o   t h e   f i l e� ��� r    ��� 4    �$�
�$ 
psxf� o    �#�# 0 	tmpdofile 	tmpDoFile� o      �"�" "0 stupidapplefile stupidAppleFile� ��� Q    a���� k    A�� ��� I   �!��
�! .rdwropenshor       file� o    � �  "0 stupidapplefile stupidAppleFile� ���
� 
perm� m    �
� boovtrue�  � ��� I    '���
� .rdwrseofnull���     ****� o     !�� "0 stupidapplefile stupidAppleFile� ���
� 
set2� m   " #��  �  � ��� I  ( 3���
� .rdwrwritnull���     ****� l  ( -���� I  ( -���
� .JonsgClp****    ��� null�  �  �  �  � ���
� 
refn� o   . /�� "0 stupidapplefile stupidAppleFile�  � ��� I  4 ;���
� .rdwrwritnull���     ****� o   4 5�
� 
ret � ���
� 
refn� o   6 7�
�
 "0 stupidapplefile stupidAppleFile�  � ��	� I  < A���
� .rdwrclosnull���     ****� o   < =�� "0 stupidapplefile stupidAppleFile�  �	  � R      ���
� .ascrerr ****      � ****�  �  � k   I a�� ��� I  I N���
� .rdwrclosnull���     ****� o   I J� �  "0 stupidapplefile stupidAppleFile�  � ���� O   O a��� I  S `����
�� .sysodlogaskr        TEXT� m   S T�� ��� L H a d   t r o u b l e   w i t h   t h e   t e m p o r a r y   d o - f i l e� �����
�� 
btns� J   W \�� ���� m   W Z�� ���  C a n c e l��  ��  � m   O P  �                                                                                  MACS  alis    h  	Tucholsky                  �:��H+   Oh
Finder.app                                                      O�Ƙ�        ����  	                CoreServices    �:�      ƘK�     Oh Og� Og�  0Tucholsky:System:Library:CoreServices:Finder.app   
 F i n d e r . a p p   	 T u c h o l s k y  &System/Library/CoreServices/Finder.app  / ��  ��  �  l  b b����   #  applescript really is a pita    � :   a p p l e s c r i p t   r e a l l y   i s   a   p i t a  O   b q	 I  k p������
�� .miscactvnull��� ��� null��  ��  	 4   b h��

�� 
capp
 o   f g���� 0 	stataname 	stataName �� Z   r �� =   r w o   r s���� 0 dowhat doWhat m   s v �  m e n u Q   z � I   } ������� 0 	doviamenu 	doViaMenu �� o   ~ ���� 0 	stataname 	stataName��  ��   R      ������
�� .ascrerr ****      � ****��  ��   k   � �  I   � ������� "0 createmenuitems createMenuItems  o   � ����� 0 	stataname 	stataName �� o   � ����� 0 	tmpdofile 	tmpDoFile��  ��     l  � ���!"��  ! 8 2 need to be sure the menu item exists on first try   " �## d   n e e d   t o   b e   s u r e   t h e   m e n u   i t e m   e x i s t s   o n   f i r s t   t r y  $%$ I  � ���&��
�� .sysodelanull��� ��� nmbr& m   � ����� ��  % '��' Q   � �()*( I   � ���+���� 0 	doviamenu 	doViaMenu+ ,��, o   � ����� 0 	stataname 	stataName��  ��  ) R      ������
�� .ascrerr ****      � ****��  ��  * O   � �-.- I  � ���/0
�� .sysodlogaskr        TEXT/ m   � �11 �22 v S o m e t h i n g   w e n t   w r o n g . . .   i s   y o u r   s t a t a   v e r s i o n   s e t   p r o p e r l y ?0 ��3��
�� 
btns3 J   � �44 5��5 m   � �66 �77  C a n c e l��  ��  . m   � �88�                                                                                  MACS  alis    h  	Tucholsky                  �:��H+   Oh
Finder.app                                                      O�Ƙ�        ����  	                CoreServices    �:�      ƘK�     Oh Og� Og�  0Tucholsky:System:Library:CoreServices:Finder.app   
 F i n d e r . a p p   	 T u c h o l s k y  &System/Library/CoreServices/Finder.app  / ��  ��  ��   l  � 9:;9 Z   � <=��>< =   � �?@? o   � ����� 0 dowhat doWhat@ m   � �AA �BB  i n c l u d e= Q   � �CDEC n  � �FGF I   � ���H���� 0 pastetmpstata pasteTmpStataH IJI o   � ����� 0 	stataname 	stataNameJ K��K b   � �LML m   � �NN �OO  i n c l u d e  M o   � ����� 0 	tmpdofile 	tmpDoFile��  ��  G  f   � �D R      ������
�� .ascrerr ****      � ****��  ��  E O   � �PQP I  � ���RS
�� .sysodlogaskr        TEXTR m   � �TT �UU \ H a d   t r o u b l e   r u n n i n g   v i a   t e m p o r a r y   i n c l u d e   f i l eS ��V��
�� 
btnsV J   � �WW X��X m   � �YY �ZZ  C a n c e l��  ��  Q m   � �[[�                                                                                  MACS  alis    h  	Tucholsky                  �:��H+   Oh
Finder.app                                                      O�Ƙ�        ����  	                CoreServices    �:�      ƘK�     Oh Og� Og�  0Tucholsky:System:Library:CoreServices:Finder.app   
 F i n d e r . a p p   	 T u c h o l s k y  &System/Library/CoreServices/Finder.app  / ��  ��  > l  � \]^\ Q   � _`a_ k   �bb cdc l  � ���ef��  e = 7 'open' changes directory as an unavoidable side-effect   f �gg n   ' o p e n '   c h a n g e s   d i r e c t o r y   a s   a n   u n a v o i d a b l e   s i d e - e f f e c td hih l  � ���jk��  j   open stupidAppleFile   k �ll *   o p e n   s t u p i d A p p l e F i l ei m��m n  �non I   ���p���� 0 pastetmpstata pasteTmpStatap qrq o   � ����� 0 	stataname 	stataNamer s��s b   � tut m   � �vv �ww  d o  u o   � ����� 0 	tmpdofile 	tmpDoFile��  ��  o  f   � ���  ` R      ������
�� .ascrerr ****      � ****��  ��  a O   xyx I ��z{
�� .sysodlogaskr        TEXTz m  || �}} R H a d   t r o u b l e   r u n n i n g   v i a   t e m p o r a r y   d o - f i l e{ ��~��
�� 
btns~ J   ���� m  �� ���  C a n c e l��  ��  y m  ���                                                                                  MACS  alis    h  	Tucholsky                  �:��H+   Oh
Finder.app                                                      O�Ƙ�        ����  	                CoreServices    �:�      ƘK�     Oh Og� Og�  0Tucholsky:System:Library:CoreServices:Finder.app   
 F i n d e r . a p p   	 T u c h o l s k y  &System/Library/CoreServices/Finder.app  / ��  ]   doing via dofile   ^ ��� "   d o i n g   v i a   d o f i l e: I C doing via dofile or include--- needs fixing for multiple instances   ; ��� �   d o i n g   v i a   d o f i l e   o r   i n c l u d e - - -   n e e d s   f i x i n g   f o r   m u l t i p l e   i n s t a n c e s��  � ��� l     ��������  ��  ��  � ��� i    ��� I      ������� 0 	doviamenu 	doViaMenu� ���� o      ���� 0 	stataname 	stataName��  ��  � O     /��� Z    .������� 1    ��
�� 
uien� O    *��� I   )�����
�� .prcsclicuiel    ��� uiel� n    %��� 4   " %���
�� 
menI� m   # $�� ���  r u n   t m p   f i l e� n    "��� 4    "���
�� 
menE� m     !���� � n    ��� 4    ���
�� 
menI� m    �� ��� & A p p l e s c r i p t   h e l p e r s� n    ��� 4    ���
�� 
menE� m    ���� � n    ��� 4    ���
�� 
mbri� m    �� ���  U s e r� 4    ���
�� 
mbar� m    ���� ��  � 4    ���
�� 
pcap� o    ���� 0 	stataname 	stataName��  ��  � m     ���                                                                                  sevs  alis    �  	Tucholsky                  �:��H+   OhSystem Events.app                                               P��7��        ����  	                CoreServices    �:�      �8'7     Oh Og� Og�  7Tucholsky:System:Library:CoreServices:System Events.app   $  S y s t e m   E v e n t s . a p p   	 T u c h o l s k y  -System/Library/CoreServices/System Events.app   / ��  � ��� l     ��������  ��  ��  � ��� i    ��� I      ������� "0 createmenuitems createMenuItems� ��� o      ���� 0 	stataname 	stataName� ���� o      ���� 0 	tmpdofile 	tmpDoFile��  ��  � O     G��� Z    F������� 1    ��
�� 
uien� O    B��� k    A�� ��� l   ������  � * $ get the command window to the front   � ��� H   g e t   t h e   c o m m a n d   w i n d o w   t o   t h e   f r o n t� ��� I   #�����
�� .prcsclicuiel    ��� uiel� n   ��� 4    ���
�� 
menI� m    �� ���  C o m m a n d� n    ��� 4    ���
�� 
menE� m    �� ���  W i n d o w� n   ��� 4    ���
�� 
mbri� m    �� ���  W i n d o w� 4    ���
�� 
mbar� m    ���� ��  � ��� I  $ +�����
�� .prcskprsnull���    utxt� b   $ '��� m   $ %�� ��� r w i n d o w   m e n u   a p p e n d   s u b m e n u   " s t U s e r "   " A p p l e s c r i p t   h e l p e r s "� o   % &��
�� 
ret ��  � ��� I  , 7�����
�� .prcskprsnull���    utxt� b   , 3��� b   , 1��� b   , /��� m   , -�� ��� � w i n d o w   m e n u   a p p e n d   i t e m   " A p p l e s c r i p t   h e l p e r s "   " r u n   t m p   f i l e "   " d o  � o   - .���� 0 	tmpdofile 	tmpDoFile� m   / 0�� ���  "� o   1 2��
�� 
ret ��  � ���� I  8 A�����
�� .prcskprsnull���    utxt� b   8 =��� m   8 ;�� ��� & w i n d o w   m e n u   r e f r e s h� o   ; <��
�� 
ret ��  ��  � 4    ���
�� 
pcap� o    ���� 0 	stataname 	stataName��  ��  � m     ���                                                                                  sevs  alis    �  	Tucholsky                  �:��H+   OhSystem Events.app                                               P��7��        ����  	                CoreServices    �:�      �8'7     Oh Og� Og�  7Tucholsky:System:Library:CoreServices:System Events.app   $  S y s t e m   E v e n t s . a p p   	 T u c h o l s k y  -System/Library/CoreServices/System Events.app   / ��  � ��� l     �������  ��  �  � ��� i    ��� I      �~��}�~ 0 pastetmpstata pasteTmpStata� ��� o      �|�| 0 	stataname 	stataName� ��{� o      �z�z 0 pasteme pasteMe�{  �}  � k     ��� ��� q      �� �y�x�y 0 oldclipboard oldClipBoard�x  �    r      I    �w�v�u
�w .JonsgClp****    ��� null�v  �u   o      �t�t 0 oldclipboard oldClipBoard  Q    � k    h		 

 I   �s�r
�s .JonspClpnull���     **** l   �q�p c     o    �o�o 0 pasteme pasteMe m    �n
�n 
ctxt�q  �p  �r   �m O    h Z    g�l�k 1    �j
�j 
uien O    c k   % b  I  % 6�i�h
�i .prcsclicuiel    ��� uiel n  % 2 4   / 2�g
�g 
menI m   0 1 �  C o m m a n d n   % / !  4   , /�f"
�f 
menE" m   - .## �$$  W i n d o w! n  % ,%&% 4   ) ,�e'
�e 
mbri' m   * +(( �))  W i n d o w& 4   % )�d*
�d 
mbar* m   ' (�c�c �h   +,+ I  7 <�b-�a
�b .sysodelanull��� ��� nmbr- m   7 8.. ?ə������a  , /0/ I  = T�`1�_
�` .prcsclicuiel    ��� uiel1 n  = P232 4   K P�^4
�^ 
menI4 l 	 L O5�]�\5 m   L O66 �77 
 P a s t e�]  �\  3 n   = K898 4   F K�[:
�[ 
menE: m   G J;; �<<  E d i t9 n  = F=>= 4   A F�Z?
�Z 
mbri? m   B E@@ �AA  E d i t> 4   = A�YB
�Y 
mbarB m   ? @�X�X �_  0 CDC l  U U�WEF�W  E > 8 added delay when seeing odd behavior on machine at work   F �GG p   a d d e d   d e l a y   w h e n   s e e i n g   o d d   b e h a v i o r   o n   m a c h i n e   a t   w o r kD HIH l  U U�VJK�V  J U O it seems that a delay of under 0.2 seconds makes things weird on fast machines   K �LL �   i t   s e e m s   t h a t   a   d e l a y   o f   u n d e r   0 . 2   s e c o n d s   m a k e s   t h i n g s   w e i r d   o n   f a s t   m a c h i n e sI MNM I  U Z�UO�T
�U .sysodelanull��� ��� nmbrO m   U VPP ?ə������T  N Q�SQ I  [ b�RR�Q
�R .prcskprsnull���    utxtR o   [ ^�P
�P 
ret �Q  �S   4    "�OS
�O 
pcapS o     !�N�N 0 	stataname 	stataName�l  �k   m    TT�                                                                                  sevs  alis    �  	Tucholsky                  �:��H+   OhSystem Events.app                                               P��7��        ����  	                CoreServices    �:�      �8'7     Oh Og� Og�  7Tucholsky:System:Library:CoreServices:System Events.app   $  S y s t e m   E v e n t s . a p p   	 T u c h o l s k y  -System/Library/CoreServices/System Events.app   / ��  �m   R      �M�L�K
�M .ascrerr ****      � ****�L  �K   k   p �UU VWV I  p u�JX�I
�J .JonspClpnull���     ****X o   p q�H�H 0 oldclipboard oldClipBoard�I  W Y�GY O   v �Z[Z I  | ��F\]
�F .sysodlogaskr        TEXT\ m   | ^^ �__ V H a d   t r o u b l e   p a s t i n g   t o   S t a t a   c o m m a n d   w i n d o w] �E`�D
�E 
btns` J   � �aa b�Cb m   � �cc �dd  C a n c e l�C  �D  [ m   v yee�                                                                                  MACS  alis    h  	Tucholsky                  �:��H+   Oh
Finder.app                                                      O�Ƙ�        ����  	                CoreServices    �:�      ƘK�     Oh Og� Og�  0Tucholsky:System:Library:CoreServices:Finder.app   
 F i n d e r . a p p   	 T u c h o l s k y  &System/Library/CoreServices/Finder.app  / ��  �G   f�Bf I  � ��Ag�@
�A .JonspClpnull���     ****g o   � ��?�? 0 oldclipboard oldClipBoard�@  �B  � hih l     �>�=�<�>  �=  �<  i jkj i    lml I      �;n�:�; "0 stripblanklines stripBlankLinesn o�9o o      �8�8 0 thetext theText�9  �:  m k     ipp qrq q      ss �7t�7 0 theparas theParast �6u�6 0 thepara theParau �5v�5 0 achar aCharv �4w�4 0 thecleanstuff theCleanStuffw �3�2�3 0 eraseme  �2  r xyx r     z{z l    |�1�0| n     }~} 2   �/
�/ 
cpar~ o     �.�. 0 thetext theText�1  �0  { o      �-�- 0 theparas theParasy � r    
��� J    �,�,  � o      �+�+ 0 thecleanstuff theCleanStuff� ��� X    ^��*�� k    Y�� ��� r    ��� m    �)
�) boovtrue� o      �(�( 0 eraseme  � ��� X    I��'�� Z   1 D���&�%� H   1 8�� E  1 7��� J   1 5�� ��� m   1 2�� ���   � ��$� m   2 3�� ���  	�$  � o   5 6�#�# 0 achar aChar� k   ; @�� ��� r   ; >��� m   ; <�"
�" boovfals� o      �!�! 0 eraseme  � �� �  S   ? @�   �&  �%  �' 0 achar aChar� n   " %��� 2   # %�
� 
cha � o   " #�� 0 thepara thePara� ��� Z   J Y����� H   J L�� o   J K�� 0 eraseme  � r   O U��� l  O R���� c   O R��� o   O P�� 0 thepara thePara� m   P Q�
� 
TEXT�  �  � l     ���� n      ���  ;   S T� o   R S�� 0 thecleanstuff theCleanStuff�  �  �  �  �  �* 0 thepara thePara� o    �� 0 theparas theParas� ��� r   _ d��� o   _ `�
� 
ret � l     ���� 1   ` c�
� 
txdl�  �  � ��� L   e i�� l  e h���� c   e h��� o   e f�
�
 0 thecleanstuff theCleanStuff� m   f g�	
�	 
TEXT�  �  �  k ��� l     ����  �  �  � ��� l     ����  �  �  �       	����������  � � ������������
�  .aevtoappnull  �   � ****�� 0 badfirstarg badFirstArg�� 0 dotmpdofile doTmpDofile�� 0 	doviamenu 	doViaMenu�� "0 createmenuitems createMenuItems�� 0 pastetmpstata pasteTmpStata�� "0 stripblanklines stripBlankLines� �� !��������
�� .aevtoappnull  �   � ****�� 0 args  ��  � 
���������������������� 0 args  �� 0 numargs numArgs�� 0 pasteme pasteMe�� 0 dothis doThis�� 0 	tmpdofile 	tmpDoFile�� 0 howmanystatas howManyStatas�� 0 	thestatas 	theStatas�� 0 thestataname theStataName�� $0 defaulttmpdofile defaultTmpDoFile�� 0 uiok UIOK� + ; P�� o `�� e������ m������ � � � ����� ��������� � � � ����������%*;@��}����
�� 
uien
�� 
btns
�� .sysodlogaskr        TEXT
�� .miscactvnull��� ��� null
�� 
xppb
�� 
xpcp
�� 
leng
�� 
cobj�� �� 0 badfirstarg badFirstArg��  ��  
�� .JonsgClp****    ��� null�� "0 stripblanklines stripBlankLines
�� 
prcs�  
�� 
pnam
�� .corecnte****       ****
�� .sysobeepnull��� ��� long
�� 
capp�� 0 pastetmpstata pasteTmpStata�� 0 dotmpdofile doTmpDofile��l�E�O� *�,E eE�Y fE�UO� "� ���kvl O*j O*��/*�,FUY.��,E�O J��k/E�O��a a a v� 
)j+ Y hO�k ��l/E�O�a   �E�Y hY �E�W X  )j+ O)*j k+ E�O�a   a  a �a kvl UY hO� *a -a [a ,\Za  @1E�UO�j !E�O�j  a  *j "Oa #�a $kvl UY 2�k a  a %�a &kvl UOPY hO� ��k/a ,E�UO*a '�/ *j UO�a (  )��l+ )Y 
)���m+ *� ������������� 0 badfirstarg badFirstArg��  ��  �  � �������
�� 
btns
�� .sysodlogaskr        TEXT�� � ���kvl U� ������������� 0 dotmpdofile doTmpDofile�� ����� �  �������� 0 	stataname 	stataName�� 0 	tmpdofile 	tmpDoFile�� 0 dowhat doWhat��  � ������������ 0 	stataname 	stataName�� 0 	tmpdofile 	tmpDoFile�� 0 dowhat doWhat�� 
0 tmpdir  �� "0 stupidapplefile stupidAppleFile� #��������������������������� ����������������16AN��TYv|�
�� .sysoexecTEXT���     TEXT
�� 
psxf
�� 
perm
�� .rdwropenshor       file
�� 
set2
�� .rdwrseofnull���     ****
�� .JonsgClp****    ��� null
�� 
refn
�� .rdwrwritnull���     ****
�� 
ret 
�� .rdwrclosnull���     ****��  ��  
�� 
btns
�� .sysodlogaskr        TEXT
�� 
capp
�� .miscactvnull��� ��� null�� 0 	doviamenu 	doViaMenu�� "0 createmenuitems createMenuItems
�� .sysodelanull��� ��� nmbr�� 0 pastetmpstata pasteTmpStata��!�j E�O��%E�O*�/E�O .��el O��jl O*j �l 	O��l 	O�j W X  �j O� �a a kvl UO*a �/ *j UO�a   I *�k+ W :X  *��l+ Okj O *�k+ W X  � a a a kvl UY a�a   / )�a �%l+ W X  � a a a kvl UY , )�a  �%l+ W X  � a !a a "kvl U� ������������� 0 	doviamenu 	doViaMenu�� ����� �  ���� 0 	stataname 	stataName��  � ���� 0 	stataname 	stataName� ������������������
�� 
uien
�� 
pcap
�� 
mbar
�� 
mbri
�� 
menE
�� 
menI
�� .prcsclicuiel    ��� uiel�� 0� ,*�,E $*�/ *�k/��/�k/��/�k/��/j 
UY hU� ������������� "0 createmenuitems createMenuItems�� ����� �  ������ 0 	stataname 	stataName�� 0 	tmpdofile 	tmpDoFile��  � ������ 0 	stataname 	stataName�� 0 	tmpdofile 	tmpDoFile� ��������������������������
�� 
uien
�� 
pcap
�� 
mbar
�� 
mbri
�� 
menE
�� 
menI
�� .prcsclicuiel    ��� uiel
�� 
ret 
�� .prcskprsnull���    utxt�� H� D*�,E <*�/ 1*�k/��/��/��/j 
O��%j O�%�%�%j Oa �%j UY hU� ������������� 0 pastetmpstata pasteTmpStata�� ����� �  ������ 0 	stataname 	stataName�� 0 pasteme pasteMe��  � �������� 0 	stataname 	stataName�� 0 pasteme pasteMe�� 0 oldclipboard oldClipBoard� ������T������~(�}#�|�{.�z@;6�y�x�w�ve^�uc�t
�� .JonsgClp****    ��� null
�� 
ctxt
�� .JonspClpnull���     ****
�� 
uien
�� 
pcap
� 
mbar
�~ 
mbri
�} 
menE
�| 
menI
�{ .prcsclicuiel    ��� uiel
�z .sysodelanull��� ��� nmbr
�y 
ret 
�x .prcskprsnull���    utxt�w  �v  
�u 
btns
�t .sysodlogaskr        TEXT�� �*j  E�O b��&j O� R*�,E J*�/ ?*�k/��/��/��/j O�j O*�k/�a /�a /�a /j O�j O_ j UY hUW #X  �j Oa  a a a kvl UO�j � �sm�r�q���p�s "0 stripblanklines stripBlankLines�r �o��o �  �n�n 0 thetext theText�q  � �m�l�k�j�i�h�m 0 thetext theText�l 0 theparas theParas�k 0 thepara thePara�j 0 achar aChar�i 0 thecleanstuff theCleanStuff�h 0 eraseme  � 
�g�f�e�d�c���b�a�`
�g 
cpar
�f 
kocl
�e 
cobj
�d .corecnte****       ****
�c 
cha 
�b 
TEXT
�a 
ret 
�` 
txdl�p j��-E�OjvE�O R�[��l kh eE�O )��-[��l kh ��lv� 
fE�OY h[OY��O� ��&�6FY h[OY��O�*�,FO��&ascr  ��ޭ