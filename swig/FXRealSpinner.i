/* FXRealSpinner.i */

%pythonappend FX::FXRealSpinner::FXRealSpinner %{
  self.thisown = False
%}
%pythonappend FX::FXPyRealSpinner::FXPyRealSpinner %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXRealSpinner.h"

namespace FX {
class FXPyRealSpinner : public FXRealSpinner {
    FXDECLARE(FXPyRealSpinner)
public:
    FXPyRealSpinner(FXComposite *p,FXint cols,FXObject *tgt=NULL,FXSelector sel=0,FXuint opts=REALSPIN_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}
