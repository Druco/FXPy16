/* FXPicker.i */

%pythonappend FX::FXPicker::FXPicker %{
  self.thisown = False
%}
%pythonappend FX::FXPyPicker::FXPyPicker %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXPicker.h"

namespace FX {
class FXPyPicker : public FXPicker {
    FXDECLARE(FXPyPicker)
public:
    FXPyPicker(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=BUTTON_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}
