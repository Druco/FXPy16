/* FXDict.i */

%pythonappend FX::FXDict::FXDict %{
  self.thisown = False
%}
%pythonappend FX::FXPyDict::FXPyDict %{
  self.thisown = False
  FXPyRegister(self)
%}

#ifndef FXOBJECT_H
#include "FXObject.h"
#endif

namespace FX {


/**
* The dictionary class maintains a fast-access hash table of entities
* indexed by a character string.
* It is typically used to map strings to pointers; however, overloading
* the createData() and deleteData() members allows any type of data to
* be indexed by strings.
*/
class FXDict : public FXObject {
public:

  /**
  * Construct an empty dictionary.
  */
  FXDict();

  /// Copy constructor; does bit-copy of void pointer data.
  FXDict(const FXDict& orig);

  /// Assignment operator
  FXDict& operator=(const FXDict& orig);

  /**
  * Resize the table to the given size.
  */
  void size(FXint m);

  /**
  * Return the size of the table, including the empty slots.
  */
  FXint size() const { return total; }

  /**
  * Return the total number of entries in the table.
  */
  FXint no() const { return number; }

  /**
  * Insert a new entry into the table given key and mark.
  * If there is already an entry with that key, leave it unchanged,
  * otherwise insert the new entry.
  */
  void* insert(const FXchar* ky,const void* ptr,bool mrk=false);

  /**
  * Replace data at key, if the entry's mark is less than
  * or equal to the given mark.  If there was no existing entry,
  * a new entry is inserted with the given mark.
  */
  void* replace(const FXchar* ky,const void* ptr,bool mrk=false);

  /**
  * Remove data given key.
  */
  void* remove(const FXchar* ky);

  /**
  * Find data pointer given key.
  */
  void* find(const FXchar* ky) const;

  /**
  * Return true if slot is empty.
  */
  bool empty(FXint pos) const { return dict[pos].hash<0; }

  /**
  * Return key at position pos.
  */
  const FXchar* key(FXuint pos) const { return dict[pos].key; }

  /**
  * return data pointer at position pos.
  */
  void* data(FXuint pos) const { return dict[pos].data; }

  /**
  * Return mark flag of entry at position pos.
  */
  bool mark(FXuint pos) const { return dict[pos].mark; }

  /**
  * Return position of first filled slot, or >= total
  */
  FXint first() const;

  /**
  * Return position of last filled slot or -1
  */
  FXint last() const;


  /**
  * Return position of next filled slot in hash table
  * or a value greater than or equal to total if no filled
  * slot was found
  */
  FXint next(FXint pos) const;

  /**
  * Return position of previous filled slot in hash table
  * or a -1 if no filled slot was found
  */
  FXint prev(FXint pos) const;

  /// Clear all entries
  void clear();

  /// Destructor
  virtual ~FXDict();
  };

class FXPyDict : public FXDict {
    FXDECLARE(FXPyDict)
public:
    FXPyDict();
};

}
