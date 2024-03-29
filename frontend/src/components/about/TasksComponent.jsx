import { faHouse } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import axios from 'axios'
import React, { useState } from 'react'
import toast from 'react-hot-toast'
import { useSelector } from 'react-redux'

const TasksComponent = (props) => {
    const { task, name } = props

    const user = useSelector(state => state.user.userInfo)

    const [sliderValue, setSliderValue] = useState(task.status);
    const handleSliderChange = (event) => {
        setSliderValue(parseInt(event.target.value, 10));
    };

    const formatDate = (dateString) => {
        const date = new Date(dateString);
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        return `${day}-${month}-${year}`;
    };

    const updateTaskValue = async (e) => {
        try {
            const response = await axios.patch(`${process.env.REACT_APP_API_URL}/room/tasks`, {
                index: props.idx,
                room_id: props.roomid,
                email: user.email,
                updatedTasks: {
                    ...task, status: sliderValue
                }
            });

            toast.success(response.data.message)
        } catch (error) {
            console.log(error.message)
        }
    }

    if (!task) return

    return (
        <>
            <div className="priority">{task.priority === 1 ? <p className='text-red-500'>High Priority</p> : task.priority === 2 ? <p className='text-yellow-500'>Low priority</p> : <p className='text-green-500'>Least Priority</p>}</div>
            {/* <Link to="room/ax325"> */}
            <div className='icon__wrapper'>
                <FontAwesomeIcon icon={faHouse} />
            </div>
            <p className='text-3xl underline w-full mt-4'>Task : {task.task_name}</p>
            <p className='text-xl w-full mt-4'>Description : {task.description}</p>
            <p className='text-xl w-full mt-4'>Room : {task.room_name}</p>
            <p className='text-xl w-full mt-4'>Assigned To: {name}</p>
            <p className='text-xl w-full mt-4'>Deadline: {formatDate(task.deadline)}</p>
            <label htmlFor="slider" className='text-xl'>Progress:</label>
            <input
                type="range"
                id="slider"
                name="slider"
                className='text-xl'
                min="0"
                max="100"
                value={sliderValue}
                onChange={handleSliderChange}
            />
            <p className='text-xl'>
                {sliderValue}%
            </p>

            <br />

            <table className='flex flex-wrap w-full justify-center my-4 text-xl'>
                <thead className='w-3/4'>
                    <tr className='w-full flex bg-purple-300 flex-wrap'>
                        <td className='border text-center border-purple-600 w-1/2'>Materials</td>
                        <td className='border text-center border-purple-600 w-1/2'>Cost</td>
                    </tr>
                </thead>
                <tbody className='w-3/4'>
                    {
                        task.materials.map((mat, idx) =>
                            <tr key={idx} className='w-ful flex flex-wrap'>
                                <td className='border text-center border-purple-600 w-1/2'>{mat.material_name}</td>
                                <td className='border text-center border-purple-600 w-1/2'>{mat.material_price}</td>
                            </tr>
                        )
                    }
                </tbody>
            </table>

            <br />
            <div className="w-full flex justify-center text-xl">
                <button onClick={updateTaskValue} className='bg-blue-500 text-white text-xl rounded py-3 px-4'>Update</button>
            </div>
        </>
    )
}

export default TasksComponent