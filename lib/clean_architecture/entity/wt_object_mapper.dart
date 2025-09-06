abstract class WTObjectMapper<E, M> {

  E toEntity(M model);

  M toModel(E entity);

}