public import Buffer_Linear_Primitive
public import Column
public import Dictionary_Ordered
public import Dictionary
public import Hash_Indexed_Primitive
import Hash
public import Ownership_Shared_Primitive

extension SVG.Context {

    public typealias Attributes = __DictionaryOrdered<
        Ownership.Shared<
            Hash.Entry<String, String>,
            Hash.Indexed<Column.Heap<Hash.Entry<String, String>>>
        >
    >
}
