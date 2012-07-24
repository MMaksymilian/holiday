package test.primaris.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 23.07.12
 * Time: 15:40
 * To change this template use File | Settings | File Templates.
 */
@MappedSuperclass
public abstract class BaseEntity implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE, generator="idSequence")
    Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
