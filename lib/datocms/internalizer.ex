defmodule DatoCMS.Internalizer do
  import AtomMap

  def internalize(site, items) do
    site = atom_map(site)
    items = atom_map(items)
    {:ok, internalized_item_types_by_id} =
      DatoCMS.InternalizedItemTypesById.from(site)
    {:ok, items_by_type} =
      DatoCMS.InternalizedItemsByType.from(items, internalized_item_types_by_id)
    {
      :ok,
      [
        items_by_type: items_by_type,
        internalized_item_types_by_id: internalized_item_types_by_id,
        site: site
      ]
    }
  end
end
