package test.primaris.dao;

import test.primaris.entity.Holiday;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 23.07.12
 * Time: 15:41
 * To change this template use File | Settings | File Templates.
 */
public interface HolidayDAO {
    Holiday getById(Long id);
}
